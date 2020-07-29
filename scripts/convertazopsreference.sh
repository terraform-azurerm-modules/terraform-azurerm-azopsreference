#!/bin/bash
set -e

export MANAGEMENTGROUPNAMEREFERENCE="var.management_group_name"

###############################################################################
#
# Script functions
#

usage() { 
  echo "Usage: $0 [-r <refdir>] [-o <outdir>]" 1>&2; exit 1;
}

exit_abnormal() {
  usage
  exit 1
}

generate_tf_name() {
  local TFNAME=""
  TFNAME=$(echo $1 \
          | sed "s/Microsoft.Authorization_$2-//" \
          | sed 's/.parameters.json//' \
          | sed 's/-/_/g' \
          | tr '[:upper:]' '[:lower:]')
  if [ "$TFNAME" == "" ]; then
    echo "Could not generate out file name from $1" 1>&2
    exit_abnormal
  fi
  echo $TFNAME
}

process_policydef() {
  local PDBASE=$(basename $1)
  echo "Converting: $PDBASE"
  local POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $1)
  local TFNAME=$(generate_tf_name $PDBASE policyDefinitions)
  local POLICYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Name')
  local POLICYDISPLAYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.DisplayName')
  local POLICYDESCRIPTION=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Description')
  local POLICYMODE=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Mode')
  local POLICYPARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  if [ ! "$POLICYPARAMETERS" == "{}" ] && [ ! "$POLICYPARAMETERS" == "null" ]; then
    local POLICYPARAMETERLINE="  parameters            = <<PARAMETERS
$POLICYPARAMETERS
PARAMETERS
"
  else
    local POLICYPARAMETERLINE=""
  fi

  cat << EOF >$2/policydefinition-${TFNAME}.tf
# This file was auto generated
resource "azurerm_policy_definition" "${TFNAME}" {
  name                  = "$POLICYNAME"
  policy_type           = "Custom"
  mode                  = "$POLICYMODE"
  display_name          = "$POLICYDISPLAYNAME"
  description           = "$POLICYDESCRIPTION"

  management_group_name = $MANAGEMENTGROUPNAMEREFERENCE
  policy_rule           = <<POLICYRULE
$(echo $POLICYJSON | jq '.parameters.input.value.Properties.PolicyRule')
POLICYRULE

$POLICYPARAMETERLINE
}

output "policydefinition_$TFNAME" {
  value = azurerm_policy_definition.$TFNAME
}

EOF
}

process_policysetdef() {
  local PSDBASE=$(basename $1)
  echo "Converting: $PSDBASE"
  local POLICYJSON=$(jq 'def recurse_remove_null: walk( if type == "object" then with_entries( select( .value != null ) ) else . end); recurse_remove_null | .' $1)
  local TFNAME=$(generate_tf_name $PSDBASE policySetDefinitions)
  local POLICYSETNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Name')
  local POLICYSETDISPLAYNAME=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.DisplayName')
  local POLICYSETDESCRIPTION=$(echo $POLICYJSON | jq -r '.parameters.input.value.Properties.Description')
  local POLICYSETPARAMETERS=$(echo $POLICYJSON | jq '.parameters.input.value.Properties.Parameters')
  local POLICYSETDEPS=$(for dep in `echo $POLICYJSON \
                        | jq -r '.parameters.input.value.Properties.PolicyDefinitions[].policyDefinitionId' \
                        | cut -d / -f 9 \
                        | tr '[:upper:]' '[:lower:]' \
                        | sed 's/-/_/g' \
                        | sort `; do \
                            echo "    "azurerm_policy_definition.$dep,; \
                        done)
  local POLICYDEFREFERENCE=$(for dep in `echo $POLICYJSON \
                        | jq -c '.parameters.input.value.Properties.PolicyDefinitions[] | .policyDefinitionReferenceId = (.policyDefinitionId | split("/")[8] | sub("-";"";"g"))'`; do
                            echo "  policy_definition_reference {"
                            echo $dep | jq -r '"    policy_definition_id = \"\(.policyDefinitionId)\""'
                            echo $dep | jq -r '"    reference_id = \"\(.policyDefinitionReferenceId)\""'
                            echo "    parameters = {"
                            echo $dep | jq -r '.parameters | to_entries | .[] | "      \(.key) = \"\(.value.value)\""'
                            echo "    }"
                            echo "  }"
                        done)
  if [ ! "$POLICYSETPARAMETERS" == "{}" ] && [ ! "$POLICYSETPARAMETERS" == "null" ]; then
    local POLICYSETPARAMETERLINE="  parameters            = <<PARAMETERS
$POLICYSETPARAMETERS
PARAMETERS"
  else
    local POLICYSETPARAMETERLINE=""
  fi
    cat << EOF >$2/policysetdefinition-${TFNAME}.tf
# This file was auto generated
resource "azurerm_policy_set_definition" "${TFNAME}" {
  name                  = "$POLICYSETNAME"
  policy_type           = "Custom"
  display_name          = "$POLICYSETDISPLAYNAME"
  description           = "$POLICYSETDESCRIPTION"
  management_group_name = $MANAGEMENTGROUPNAMEREFERENCE
  depends_on            = [
$POLICYSETDEPS
  ]
$POLICYDEFREFERENCE
$POLICYSETPARAMETERLINE
}

output "policysetdefinition_$TFNAME" {
  value = azurerm_policy_set_definition.$TFNAME
}

EOF
}

###############################################################################
#
# Script starts here
#

while getopts ":r:o:" o; do
    case "${o}" in
        r)
            REFDIR=${OPTARG}
            ;;
        o)
            OUTDIR=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

# check params
if [ ! -d "${REFDIR}" ]; then
  echo "Could not find $REFDIR" 1>&2
  exit_abnormal
fi

if [ -z "${OUTDIR}" ]; then
  echo "Output directory not specified" 1>&2
  exit_abnormal
else
  mkdir -p ${OUTDIR} || exit_abnormal
fi

# Ensure we have the necessary tools
COMMANDS="jq tr"
for COMMAND in $COMMANDS; do
  if [ ! $(command -v $COMMAND) ]; then
    echo "Could not find '$COMMAND' command. Is it installed?"
    exit_abnormal
  fi
done

# Export required functions for xargs to work
export -f generate_tf_name
export -f process_policydef
export -f process_policysetdef

# Find all policyDefinitions and convert in parallel
find $REFDIR -iname *policyDefinitions* | xargs -I % -n 1 -P 8 bash -c "process_policydef \"%\" $OUTDIR"

# Find all policySetDefinitions and convert in parallel
find $REFDIR -iname *policySetDefinitions* | xargs -I % -n 1 -P 8 bash -c "process_policysetdef \"%\" $OUTDIR"

# Replace MG prefix if specified
echo "Changing policyDefinitions refs in policysets"
find $OUTDIR -iname \*policyset\*.tf | xargs -n 1 -P 8 sed -i 's/\/ES\//\/${var.management_group_name}\//g'

# Terraform fmt
if [ $(command -v terraform) ]; then
  echo "Terraform executable found, running fmt"
  terraform fmt -list=false $OUTDIR
fi

# Clean up
unset MANAGEMENTGROUPNAMEREFERENCE
unset -f generate_tf_name
unset -f process_policydef
unset -f process_policysetdef

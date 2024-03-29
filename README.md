# ARCHIVED - terraform-azurerm-azopsreference

>  🚨 **Please use the official ALZ Terraform module at https://aka.ms/alz/tf** 🚨

This module contains the reference Azure policy & initiative (policySet) definitions from [Enterprise-Scale](https://github.com/Azure/Enterprise-Scale).

It will deploy the definitions to the supplied Azure AD Management Group.

## Usage

### Deploying the Definitions

It is very simple to get the policies deployed:

```terraform
module "azopsreference" {
  source                = "github.com/terraform-azurerm-modules/terraform-azurerm-azopsreference?ref=v0.1.0"
  management_group_name = azurerm_management_group.mymg.name
}
```

> **Note:** Update the reference to match the version you want to use

### Using the Outputs

Each policy & initiative definition has its own output, allowing you to reference the policy definition in an assignment:

```terraform
resource "azurerm_policy_assignment" "deploy_diag_loganalytics" {
  name                 = "Deploy-Diag-LogAnalytics"
  scope                = azurerm_management_group.mymg.id
  policy_definition_id = module.azopsreference.policysetdefinition_deploy_diag_loganalytics.id
  description          = "Ensure resources have diagnostic settings configured to forward to Log Analytics"
  display_name         = "Deploy-Diag-LogAnalytics"
  location             = var.default_location

  identity {
    type = "SystemAssigned"
  }

  parameters = <<PARAMETERS
{
  "logAnalytics": {
    "value": "${azurerm_log_analytics_workspace.mgmt.id}"
  }
}
PARAMETERS

}
```

For initiatives (policySets), there is an additional output, an array of all the contained policy definition objects.
This can be useful when creating remediation tasks for each of the definitions:

```terraform
resource "azurerm_policy_remediation" "deploy_diag_loganalytics" {
  count                          = length(module.azopsreference.diagnostic_policy_definitions)
  name                           = lower(module.azopsreference.diagnostic_policy_definitions[count.index].name)
  scope                          = azurerm_management_group.es.id
  policy_assignment_id           = azurerm_policy_assignment.deploy_diag_loganalytics.id
  policy_definition_reference_id = replace(module.azopsreference.diagnostic_policy_definitions[count.index].name, "-", "")
}
```

## Auto Generation

This Terraform is automatically generated from the JSON files from Enterprise Scale.
You can see the GitHub action and script that accomplished this in this repo.

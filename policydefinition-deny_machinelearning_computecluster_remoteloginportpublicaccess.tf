# This file was auto generated
resource "azurerm_policy_definition" "deny_machinelearning_computecluster_remoteloginportpublicaccess" {
  name         = "Deny-MachineLearning-ComputeCluster-RemoteLoginPortPublicAccess"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-MachineLearning-ComputeCluster-RemoteLoginPortPublicAccess"
  description  = "Deny public access of clusters via SSH."
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Machine Learning"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.MachineLearningServices/workspaces/computes"
      },
      {
        "field": "Microsoft.MachineLearningServices/workspaces/computes/computeType",
        "equals": "AmlCompute"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.MachineLearningServices/workspaces/computes/remoteLoginPortPublicAccess",
            "exists": false
          },
          {
            "field": "Microsoft.MachineLearningServices/workspaces/computes/remoteLoginPortPublicAccess",
            "notEquals": "Disabled"
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]"
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "effect": {
    "type": "String",
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    },
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ],
    "defaultValue": "Deny"
  }
}
PARAMETERS

}

output "policydefinition_deny_machinelearning_computecluster_remoteloginportpublicaccess" {
  value = azurerm_policy_definition.deny_machinelearning_computecluster_remoteloginportpublicaccess
}


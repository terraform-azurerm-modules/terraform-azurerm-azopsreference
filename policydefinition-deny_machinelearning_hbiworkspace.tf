# This file was auto generated
resource "azurerm_policy_definition" "deny_machinelearning_hbiworkspace" {
  name         = "Deny-MachineLearning-HbiWorkspace"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-MachineLearning-HbiWorkspace"
  description  = "Enforce high business impact machine learning workspaces across the environment."
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
        "equals": "Microsoft.MachineLearningServices/workspaces"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.MachineLearningServices/workspaces/hbiWorkspace",
            "exists": false
          },
          {
            "field": "Microsoft.MachineLearningServices/workspaces/hbiWorkspace",
            "notEquals": true
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

output "policydefinition_deny_machinelearning_hbiworkspace" {
  value = azurerm_policy_definition.deny_machinelearning_hbiworkspace
}


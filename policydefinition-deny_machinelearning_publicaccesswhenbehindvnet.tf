# This file was auto generated
resource "azurerm_policy_definition" "deny_machinelearning_publicaccesswhenbehindvnet" {
  name         = "Deny-MachineLearning-PublicAccessWhenBehindVnet"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-MachineLearning-PublicAccessWhenBehindVnet"
  description  = "Deny public access behind vnet for machine learning workspaces."
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
            "field": "Microsoft.MachineLearningServices/workspaces/allowPublicAccessWhenBehindVnet",
            "exists": false
          },
          {
            "field": "Microsoft.MachineLearningServices/workspaces/allowPublicAccessWhenBehindVnet",
            "notEquals": false
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

output "policydefinition_deny_machinelearning_publicaccesswhenbehindvnet" {
  value = azurerm_policy_definition.deny_machinelearning_publicaccesswhenbehindvnet
}


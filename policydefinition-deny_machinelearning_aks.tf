# This file was auto generated
resource "azurerm_policy_definition" "deny_machinelearning_aks" {
  name         = "Deny-MachineLearning-Aks"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-MachineLearning-Aks"
  description  = "Deny AKS cluster creation in machine learning and enforce connecting to existing clusters."
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
        "equals": "AKS"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.MachineLearningServices/workspaces/computes/resourceId",
            "exists": false
          },
          {
            "value": "[empty(field('Microsoft.MachineLearningServices/workspaces/computes/resourceId'))]",
            "equals": true
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

output "policydefinition_deny_machinelearning_aks" {
  value = azurerm_policy_definition.deny_machinelearning_aks
}


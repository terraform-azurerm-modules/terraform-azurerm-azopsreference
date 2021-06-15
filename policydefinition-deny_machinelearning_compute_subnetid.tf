# This file was auto generated
resource "azurerm_policy_definition" "deny_machinelearning_compute_subnetid" {
  name         = "Deny-MachineLearning-Compute-SubnetId"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-MachineLearning-Compute-SubnetId"
  description  = "Enforce subnet connectivity for machine learning compute clusters and instances."
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
        "in": [
          "AmlCompute",
          "ComputeInstance"
        ]
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.MachineLearningServices/workspaces/computes/subnet.id",
            "exists": false
          },
          {
            "value": "[empty(field('Microsoft.MachineLearningServices/workspaces/computes/subnet.id'))]",
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

output "policydefinition_deny_machinelearning_compute_subnetid" {
  value = azurerm_policy_definition.deny_machinelearning_compute_subnetid
}


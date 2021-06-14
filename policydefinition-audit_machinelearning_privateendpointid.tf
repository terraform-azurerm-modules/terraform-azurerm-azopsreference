# This file was auto generated
resource "azurerm_policy_definition" "audit_machinelearning_privateendpointid" {
  name         = "Audit-MachineLearning-PrivateEndpointId"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Audit-MachineLearning-PrivateEndpointId"
  description  = "Audit public endpoints that are created in other subscriptions for machine learning."
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
        "count": {
          "field": "Microsoft.MachineLearningServices/workspaces/privateEndpointConnections[*]",
          "where": {
            "field": "Microsoft.MachineLearningServices/workspaces/privateEndpointConnections[*].privateEndpoint.id",
            "notContains": "[subscription().id]"
          }
        },
        "greaterOrEquals": 1
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
      "Deny",
      "Disabled"
    ],
    "defaultValue": "Audit"
  }
}
PARAMETERS

}

output "policydefinition_audit_machinelearning_privateendpointid" {
  value = azurerm_policy_definition.audit_machinelearning_privateendpointid
}


# This file was auto generated
resource "azurerm_policy_definition" "deny_non_rbac_aks" {
  name         = "Deny-Non-RBAC-AKS"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-Non-RBAC-AKS"
  description  = "null"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.ContainerService/managedClusters"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.ContainerService/managedClusters/enableRBAC",
            "exists": "false"
          },
          {
            "field": "Microsoft.ContainerService/managedClusters/enableRBAC",
            "equals": "false"
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
    "defaultValue": "Audit"
  }
}
PARAMETERS

}

output "policydefinition_deny_non_rbac_aks" {
  value = azurerm_policy_definition.deny_non_rbac_aks
}


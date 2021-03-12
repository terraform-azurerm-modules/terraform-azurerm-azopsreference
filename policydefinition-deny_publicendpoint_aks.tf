# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_aks" {
  name         = "Deny-PublicEndpoint-Aks"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Public network access on AKS API should be disabled"
  description  = "This policy denies the creation of Azure Kubernetes Service non-private clusters"

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
        "field": "Microsoft.ContainerService/managedClusters/apiServerAccessProfile.enablePrivateCluster",
        "notequals": "true"
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
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "defaultValue": "Deny",
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    }
  }
}
PARAMETERS

}

output "policydefinition_deny_publicendpoint_aks" {
  value = azurerm_policy_definition.deny_publicendpoint_aks
}


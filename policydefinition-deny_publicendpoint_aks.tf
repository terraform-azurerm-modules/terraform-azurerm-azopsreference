# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_aks" {
  name         = "Deny-PublicEndpoint-Aks"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-Aks"
  description  = "This policy restricts creation of non-private AKS clusters"

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
    "effect": "Deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_publicendpoint_aks" {
  value = azurerm_policy_definition.deny_publicendpoint_aks
}


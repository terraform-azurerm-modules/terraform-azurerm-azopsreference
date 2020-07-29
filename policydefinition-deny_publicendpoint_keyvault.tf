# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_keyvault" {
  name         = "Deny-PublicEndpoint-KeyVault"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-KeyVault"
  description  = "This policy restrict creation of Key Vaults with IP Firewall exposed to all public endpoints"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.KeyVault/vaults"
      },
      {
        "field": "Microsoft.KeyVault/vaults/networkAcls.defaultAction",
        "notequals": "Deny"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_publicendpoint_keyvault" {
  value = azurerm_policy_definition.deny_publicendpoint_keyvault
}


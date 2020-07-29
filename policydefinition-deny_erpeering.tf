# This file was auto generated
resource "azurerm_policy_definition" "deny_erpeering" {
  name         = "Deny-ERPeering"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-ERPeering"
  description  = "Denies creation of ER Peerings under the assigned scope."

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings"
  },
  "then": {
    "effect": "deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_erpeering" {
  value = azurerm_policy_definition.deny_erpeering
}


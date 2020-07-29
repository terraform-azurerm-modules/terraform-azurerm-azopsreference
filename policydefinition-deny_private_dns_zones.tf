# This file was auto generated
resource "azurerm_policy_definition" "deny_private_dns_zones" {
  name         = "Deny-Private-DNS-Zones"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-Private-DNS-Zones"
  description  = "Denies creation of Private DNS Zones under the assigned scope"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/privateDnsZones"
  },
  "then": {
    "effect": "deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_private_dns_zones" {
  value = azurerm_policy_definition.deny_private_dns_zones
}


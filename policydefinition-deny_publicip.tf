# This file was auto generated
resource "azurerm_policy_definition" "deny_publicip" {
  name         = "Deny-PublicIP"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicIP"
  description  = "Denies creation of Public IPs under the assigned scope."

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/publicIPAddresses"
  },
  "then": {
    "effect": "deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_publicip" {
  value = azurerm_policy_definition.deny_publicip
}


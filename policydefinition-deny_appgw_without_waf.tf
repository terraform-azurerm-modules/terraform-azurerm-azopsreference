# This file was auto generated
resource "azurerm_policy_definition" "deny_appgw_without_waf" {
  name         = "Deny-AppGW-Without-WAF"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-AppGW-Without-WAF"
  description  = "null"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Network/applicationGateways"
      },
      {
        "field": "Microsoft.Network/applicationGateways/sku.name",
        "notequals": "WAF_v2"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_appgw_without_waf" {
  value = azurerm_policy_definition.deny_appgw_without_waf
}


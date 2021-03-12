# This file was auto generated
resource "azurerm_policy_definition" "deny_appgw_without_waf" {
  name         = "Deny-AppGW-Without-WAF"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Application Gateway should be deployed with WAF enabled"
  description  = "This policy enables you to restrict that Application Gateways is always deployed with WAF enabled"

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

output "policydefinition_deny_appgw_without_waf" {
  value = azurerm_policy_definition.deny_appgw_without_waf
}


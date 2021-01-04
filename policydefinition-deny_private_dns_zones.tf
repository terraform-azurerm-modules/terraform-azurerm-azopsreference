# This file was auto generated
resource "azurerm_policy_definition" "deny_private_dns_zones" {
  name         = "Deny-Private-DNS-Zones"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny the creation of private DNS"
  description  = "This policy denies the creation of a private DNS in the current scope, used in combination with policies that create centralized private DNS in connectivity subscription"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/privateDnsZones"
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
    "defaultValue": "Deny"
  }
}
PARAMETERS

}

output "policydefinition_deny_private_dns_zones" {
  value = azurerm_policy_definition.deny_private_dns_zones
}


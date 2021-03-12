# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_keyvault" {
  name         = "Deny-PublicEndpoint-KeyVault"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Public network access should be disabled for KeyVault"
  description  = "This policy denies creation of Key Vaults with IP Firewall exposed to all public endpoints"
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Key Vault"
}
METADATA

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

output "policydefinition_deny_publicendpoint_keyvault" {
  value = azurerm_policy_definition.deny_publicendpoint_keyvault
}


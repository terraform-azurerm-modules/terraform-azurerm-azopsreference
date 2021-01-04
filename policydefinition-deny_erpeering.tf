# This file was auto generated
resource "azurerm_policy_definition" "deny_erpeering" {
  name         = "Deny-ERPeering"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny vNet peering "
  description  = "This policy denies the creation of vNet Peerings under the assigned scope."

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings"
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

output "policydefinition_deny_erpeering" {
  value = azurerm_policy_definition.deny_erpeering
}


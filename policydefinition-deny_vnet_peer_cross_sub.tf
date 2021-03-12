# This file was auto generated
resource "azurerm_policy_definition" "deny_vnet_peer_cross_sub" {
  name         = "Deny-VNET-Peer-Cross-Sub"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny vNet peering cross subscription."
  description  = "This policy denies the creation of vNet Peerings outside of the same subscriptions under the assigned scope."
  metadata     = <<METADATA
{
  "version": "1.0.0.0",
  "category": "Network"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings"
      },
      {
        "field": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/remoteVirtualNetwork.id",
        "notcontains": "[subscription().id]"
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

output "policydefinition_deny_vnet_peer_cross_sub" {
  value = azurerm_policy_definition.deny_vnet_peer_cross_sub
}


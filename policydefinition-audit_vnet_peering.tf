# This file was auto generated
resource "azurerm_policy_definition" "audit_vnet_peering" {
  name         = "audit-vnet-peering"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Audit corp LZ connectivity"
  description  = "Audit if corp landing zones are not connected to the connectivity hub"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Resources/subscriptions"
  },
  "then": {
    "effect": "auditIfNotExists",
    "details": {
      "type": "Microsoft.Network/virtualNetworks",
      "existenceScope": "Subscription",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/remoteVirtualNetwork.id",
            "equals": "[parameters('connectivityHubId')]"
          },
          {
            "field": "type",
            "equals": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings"
          }
        ]
      }
    }
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "connectivityHubId": {
    "type": "String",
    "metadata": {
      "displayName": "Provide the resourceId for the virtual network in the connectivity hub"
    }
  }
}
PARAMETERS

}

output "policydefinition_audit_vnet_peering" {
  value = azurerm_policy_definition.audit_vnet_peering
}


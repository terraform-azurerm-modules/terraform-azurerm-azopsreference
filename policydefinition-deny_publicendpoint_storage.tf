# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_storage" {
  name         = "Deny-PublicEndpoint-Storage"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-Storage"
  description  = "This policy restrict creation of storage accounts with IP Firewall exposed to all public endpoints"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Storage/storageAccounts"
      },
      {
        "field": "Microsoft.Storage/storageAccounts/networkAcls.defaultAction",
        "notequals": "Deny"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_publicendpoint_storage" {
  value = azurerm_policy_definition.deny_publicendpoint_storage
}


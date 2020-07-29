# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_cosmosdb" {
  name         = "Deny-PublicEndpoint-CosmosDB"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-CosmosDB"
  description  = "This policy restrict creation of cosmos db accounts with exposed public endpoints"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.DocumentDB/databaseAccounts"
      },
      {
        "field": "Microsoft.DocumentDB/databaseAccounts/publicNetworkAccess",
        "notequals": "Disabled"
      }
    ]
  },
  "then": {
    "effect": "Deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_publicendpoint_cosmosdb" {
  value = azurerm_policy_definition.deny_publicendpoint_cosmosdb
}


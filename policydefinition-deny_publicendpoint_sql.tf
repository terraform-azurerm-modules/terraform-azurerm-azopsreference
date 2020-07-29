# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_sql" {
  name         = "Deny-PublicEndpoint-Sql"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-Sql"
  description  = "This policy restrict creation of Sql servers with exposed public endpoints"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Sql/servers"
      },
      {
        "field": "Microsoft.Sql/servers/publicNetworkAccess",
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

output "policydefinition_deny_publicendpoint_sql" {
  value = azurerm_policy_definition.deny_publicendpoint_sql
}


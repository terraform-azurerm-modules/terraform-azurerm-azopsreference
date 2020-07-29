# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_mysql" {
  name         = "Deny-PublicEndpoint-MySQL"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-PublicEndpoint-MySQL"
  description  = "This policy restrict creation of MySql DB accounts with exposed public endpoints"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.DBforMySQL/servers"
      },
      {
        "field": "Microsoft.DBforMySQL/servers/publicNetworkAccess",
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

output "policydefinition_deny_publicendpoint_mysql" {
  value = azurerm_policy_definition.deny_publicendpoint_mysql
}


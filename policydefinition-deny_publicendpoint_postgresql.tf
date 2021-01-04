# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_postgresql" {
  name         = "Deny-PublicEndpoint-PostgreSql"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Public network access should be disabled for PostgreSql"
  description  = "This policy denies creation of Postgre SQL DB accounts with exposed public endpoints"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.DBforPostgreSQL/servers"
      },
      {
        "field": "Microsoft.DBforPostgreSQL/servers/publicNetworkAccess",
        "notequals": "Disabled"
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

output "policydefinition_deny_publicendpoint_postgresql" {
  value = azurerm_policy_definition.deny_publicendpoint_postgresql
}


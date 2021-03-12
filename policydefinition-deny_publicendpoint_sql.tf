# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_sql" {
  name         = "Deny-PublicEndpoint-Sql"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Public network access on Azure SQL Database should be disabled"
  description  = "This policy denies creation of Sql servers with exposed public endpoints"

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

output "policydefinition_deny_publicendpoint_sql" {
  value = azurerm_policy_definition.deny_publicendpoint_sql
}


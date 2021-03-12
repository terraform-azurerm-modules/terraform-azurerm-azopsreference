# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_mariadb" {
  name         = "Deny-PublicEndpoint-MariaDB"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Public network access should be disabled for MariaDB"
  description  = "This policy denies the creation of Maria DB accounts with exposed public endpoints"
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "SQL"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.DBforMariaDB/servers"
      },
      {
        "field": "Microsoft.DBforMariaDB/servers/publicNetworkAccess",
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

output "policydefinition_deny_publicendpoint_mariadb" {
  value = azurerm_policy_definition.deny_publicendpoint_mariadb
}


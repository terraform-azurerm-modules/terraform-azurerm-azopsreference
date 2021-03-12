# This file was auto generated
resource "azurerm_policy_definition" "deny_publicendpoint_cosmosdb" {
  name         = "Deny-PublicEndpoint-CosmosDB"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Public network access should be disabled for CosmosDB"
  description  = "This policy denies that Cosmos database accounts are created with out public network access is disabled."
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
        "equals": "Microsoft.DocumentDB/databaseAccounts"
      },
      {
        "field": "Microsoft.DocumentDB/databaseAccounts/publicNetworkAccess",
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

output "policydefinition_deny_publicendpoint_cosmosdb" {
  value = azurerm_policy_definition.deny_publicendpoint_cosmosdb
}


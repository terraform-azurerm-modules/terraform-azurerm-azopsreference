# This file was auto generated
resource "azurerm_policy_definition" "deploy_sql_tde" {
  name         = "Deploy-Sql-Tde"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Sql-Tde"
  description  = "Configures SQL DataBases"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Sql/servers/databases"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Sql/transparentDataEncryption.status",
            "equals": "Enabled"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "location": {
                "type": "string"
              },
              "sqlServerName": {
                "type": "string"
              },
              "sqlServerDataBaseName": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "name": "[concat( parameters('sqlServerName'),'/',parameters('sqlServerDataBaseName'),'/current')]",
                "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
                "apiVersion": "2014-04-01",
                "properties": {
                  "status": "Enabled"
                }
              }
            ],
            "outputs": {}
          },
          "parameters": {
            "location": {
              "value": "[field('location')]"
            },
            "sqlServerName": {
              "value": "[first(split(field('fullname'),'/'))]"
            },
            "sqlServerDataBaseName": {
              "value": "[field('name')]"
            }
          }
        }
      },
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ]
    }
  }
}
POLICYRULE


}

output "policydefinition_deploy_sql_tde" {
  value = azurerm_policy_definition.deploy_sql_tde
}


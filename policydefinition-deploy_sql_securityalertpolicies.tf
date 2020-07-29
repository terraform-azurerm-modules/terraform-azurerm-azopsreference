# This file was auto generated
resource "azurerm_policy_definition" "deploy_sql_securityalertpolicies" {
  name         = "Deploy-Sql-SecurityAlertPolicies"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Sql-SecurityAlertPolicies"
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
      "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Sql/servers/databases/securityAlertPolicies/state",
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
                "name": "[concat(parameters('sqlServerName'),'/',parameters('sqlServerDataBaseName'),'/default')]",
                "type": "Microsoft.Sql/servers/databases/securityAlertPolicies",
                "apiVersion": "2018-06-01-preview",
                "properties": {
                  "state": "Enabled",
                  "disabledAlerts": [
                    ""
                  ],
                  "emailAddresses": [
                    "admin@contoso.com"
                  ],
                  "emailAccountAdmins": true,
                  "storageAccountAccessKey": "",
                  "retentionDays": 0
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

output "policydefinition_deploy_sql_securityalertpolicies" {
  value = azurerm_policy_definition.deploy_sql_securityalertpolicies
}


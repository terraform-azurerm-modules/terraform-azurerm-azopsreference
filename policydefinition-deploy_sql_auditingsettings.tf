# This file was auto generated
resource "azurerm_policy_definition" "deploy_sql_auditingsettings" {
  name         = "Deploy-Sql-AuditingSettings"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Sql-AuditingSettings"
  description  = "Configures SQL Server"

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
      "type": "Microsoft.Sql/servers/databases/auditingSettings",
      "name": "default",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Sql/servers/databases/auditingSettings/state",
            "equals": "enabled"
          },
          {
            "field": "Microsoft.Sql/servers/databases/auditingSettings/isAzureMonitorTargetEnabled",
            "equals": "true"
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
                "name": "[concat( parameters('sqlServerName'),'/',parameters('sqlServerDataBaseName'),'/default')]",
                "type": "Microsoft.Sql/servers/databases/auditingSettings",
                "apiVersion": "2017-03-01-preview",
                "properties": {
                  "state": "enabled",
                  "auditActionsAndGroups": [
                    "BATCH_COMPLETED_GROUP",
                    "DATABASE_OBJECT_CHANGE_GROUP",
                    "SCHEMA_OBJECT_CHANGE_GROUP",
                    "BACKUP_RESTORE_GROUP",
                    "APPLICATION_ROLE_CHANGE_PASSWORD_GROUP",
                    "DATABASE_PRINCIPAL_CHANGE_GROUP",
                    "DATABASE_PRINCIPAL_IMPERSONATION_GROUP",
                    "DATABASE_ROLE_MEMBER_CHANGE_GROUP",
                    "USER_CHANGE_PASSWORD_GROUP",
                    "DATABASE_OBJECT_OWNERSHIP_CHANGE_GROUP",
                    "DATABASE_OBJECT_PERMISSION_CHANGE_GROUP",
                    "DATABASE_PERMISSION_CHANGE_GROUP",
                    "SCHEMA_OBJECT_PERMISSION_CHANGE_GROUP",
                    "SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP",
                    "FAILED_DATABASE_AUTHENTICATION_GROUP"
                  ],
                  "isAzureMonitorTargetEnabled": true
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

output "policydefinition_deploy_sql_auditingsettings" {
  value = azurerm_policy_definition.deploy_sql_auditingsettings
}


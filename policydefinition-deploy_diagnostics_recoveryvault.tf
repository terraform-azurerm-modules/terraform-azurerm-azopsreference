# This file was auto generated
resource "azurerm_policy_definition" "deploy_diagnostics_recoveryvault" {
  name         = "Deploy-Diagnostics-RecoveryVault"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-RecoveryVault"
  description  = "Apply diagnostic settings for Recovery Vaults - Log Analytics"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.RecoveryServices/vaults"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "name": "setByPolicy",
      "existenceCondition": {
        "allof": [
          {
            "count": {
              "field": "Microsoft.Insights/diagnosticSettings/logs[*]",
              "where": {
                "allof": [
                  {
                    "field": "Microsoft.Insights/diagnosticSettings/logs[*].Category",
                    "in": [
                      "CoreAzureBackup",
                      "AddonAzureBackupJobs",
                      "AddonAzureBackupAlerts",
                      "AddonAzureBackupPolicy",
                      "AddonAzureBackupStorage",
                      "AddonAzureBackupProtectedInstance"
                    ]
                  },
                  {
                    "field": "Microsoft.Insights/diagnosticSettings/logs[*].Enabled",
                    "equals": "True"
                  }
                ]
              }
            },
            "Equals": 6
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "notEquals": "[parameters('logAnalytics')]"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/logAnalyticsDestinationType",
            "equals": "Dedicated"
          }
        ]
      },
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "resourceName": {
                "type": "string"
              },
              "logAnalytics": {
                "type": "string"
              },
              "location": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.RecoveryServices/vaults/providers/diagnosticSettings",
                "apiVersion": "2017-05-01-preview",
                "name": "[concat(parameters('resourceName'), '/', 'Microsoft.Insights/', 'setByPolicy')]",
                "dependsOn": [],
                "properties": {
                  "workspaceId": "[parameters('logAnalytics')]",
                  "logAnalyticsDestinationType": "Dedicated",
                  "metrics": [],
                  "logs": [
                    {
                      "category": "CoreAzureBackup",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupAlerts",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupJobs",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupPolicy",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupProtectedInstance",
                      "enabled": "true"
                    },
                    {
                      "category": "AddonAzureBackupStorage",
                      "enabled": "true"
                    }
                  ]
                }
              }
            ],
            "outputs": {}
          },
          "parameters": {
            "logAnalytics": {
              "value": "[parameters('logAnalytics')]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "resourceName": {
              "value": "[field('name')]"
            }
          }
        }
      }
    }
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "logAnalytics": {
    "type": "String",
    "metadata": {
      "displayName": "Log Analytics workspace",
      "description": "Select the Log Analytics workspace from dropdown list",
      "strongType": "omsWorkspace"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_diagnostics_recoveryvault" {
  value = azurerm_policy_definition.deploy_diagnostics_recoveryvault
}


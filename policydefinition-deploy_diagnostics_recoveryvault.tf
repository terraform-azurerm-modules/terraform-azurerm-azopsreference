# This file was auto generated
resource "azurerm_policy_definition" "deploy_diagnostics_recoveryvault" {
  name         = "Deploy-Diagnostics-RecoveryVault"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy Diagnostic Settings for Recovery Services vaults to Log Analytics workspace"
  description  = "Deploys the diagnostic settings for Recovery Services vaults to stream to a Log Analytics workspace when any Recovery Services vaults which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled"
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Monitoring"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.RecoveryServices/vaults"
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "name": "setByPolicy",
      "existenceCondition": {
        "allOf": [
          {
            "count": {
              "field": "Microsoft.Insights/diagnosticSettings/logs[*]",
              "where": {
                "allOf": [
                  {
                    "field": "Microsoft.Insights/diagnosticSettings/logs[*].Category",
                    "in": [
                      "CoreAzureBackup",
                      "AddonAzureBackupJobs",
                      "AddonAzureBackupAlerts",
                      "AddonAzureBackupPolicy",
                      "AddonAzureBackupStorage",
                      "AddonAzureBackupProtectedInstance",
                      "AzureBackupReport"
                    ]
                  },
                  {
                    "field": "Microsoft.Insights/diagnosticSettings/logs[*].Enabled",
                    "equals": "True"
                  }
                ]
              }
            },
            "equals": 7
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "equals": "[parameters('logAnalytics')]"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/logAnalyticsDestinationType",
            "equals": "Dedicated"
          }
        ]
      },
      "roleDefinitionIds": [
        "/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa",
        "/providers/microsoft.authorization/roleDefinitions/92aaf0da-9dab-42b6-94a3-d43ce8d16293"
      ],
      "deployment": {
        "properties": {
          "mode": "Incremental",
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "resourceName": {
                "type": "String"
              },
              "logAnalytics": {
                "type": "String"
              },
              "location": {
                "type": "String"
              },
              "profileName": {
                "type": "String"
              },
              "logsEnabled": {
                "type": "String"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.RecoveryServices/vaults/providers/diagnosticSettings",
                "apiVersion": "2017-05-01-preview",
                "name": "[concat(parameters('resourceName'), '/', 'Microsoft.Insights/', parameters('profileName'))]",
                "dependsOn": [],
                "properties": {
                  "workspaceId": "[parameters('logAnalytics')]",
                  "logAnalyticsDestinationType": "Dedicated",
                  "metrics": [],
                  "logs": [
                    {
                      "category": "CoreAzureBackup",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "AddonAzureBackupAlerts",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "AddonAzureBackupJobs",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "AddonAzureBackupPolicy",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "AddonAzureBackupProtectedInstance",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "AddonAzureBackupStorage",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "AzureBackupReport",
                      "enabled": "[parameters('logsEnabled')]"
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
            },
            "profileName": {
              "value": "[parameters('profileName')]"
            },
            "logsEnabled": {
              "value": "[parameters('logsEnabled')]"
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
      "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
      "strongType": "omsWorkspace"
    }
  },
  "effect": {
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    }
  },
  "profileName": {
    "type": "String",
    "defaultValue": "setbypolicy",
    "metadata": {
      "displayName": "Profile name",
      "description": "The diagnostic settings profile name"
    }
  },
  "logsEnabled": {
    "type": "String",
    "defaultValue": "True",
    "allowedValues": [
      "True",
      "False"
    ],
    "metadata": {
      "displayName": "Enable logs",
      "description": "Whether to enable logs stream to the Log Analytics workspace - True or False"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_diagnostics_recoveryvault" {
  value = azurerm_policy_definition.deploy_diagnostics_recoveryvault
}


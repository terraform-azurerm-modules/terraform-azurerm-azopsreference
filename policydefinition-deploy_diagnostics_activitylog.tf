# This file was auto generated
resource "azurerm_policy_definition" "deploy_diagnostics_activitylog" {
  name         = "Deploy-Diagnostics-ActivityLog"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy Diagnostic Settings for Activity Log to Log Analytics workspace"
  description  = "Deploys the diagnostic settings for Activity Log to stream to a Log Analytics workspace when any Activity Log which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with category enabled."
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
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Resources/subscriptions"
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "deploymentScope": "Subscription",
      "existenceScope": "Subscription",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Insights/diagnosticSettings/logs.enabled",
            "equals": "true"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "equals": "[parameters('logAnalytics')]"
          }
        ]
      },
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "logAnalytics": {
                "type": "string"
              },
              "logsEnabled": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "name": "subscriptionToLa",
                "type": "Microsoft.Insights/diagnosticSettings",
                "apiVersion": "2017-05-01-preview",
                "location": "Global",
                "properties": {
                  "workspaceId": "[parameters('logAnalytics')]",
                  "logs": [
                    {
                      "category": "Administrative",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "Security",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "ServiceHealth",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "Alert",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "Recommendation",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "Policy",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "Autoscale",
                      "enabled": "[parameters('logsEnabled')]"
                    },
                    {
                      "category": "ResourceHealth",
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
            "logsEnabled": {
              "value": "[parameters('logsEnabled')]"
            }
          }
        }
      },
      "roleDefinitionIds": [
        "/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa",
        "/providers/microsoft.authorization/roleDefinitions/92aaf0da-9dab-42b6-94a3-d43ce8d16293"
      ]
    }
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "logAnalytics": {
    "type": "String",
    "metadata": {
      "displayName": "Primary Log Analytics workspace",
      "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
      "strongType": "omsWorkspace"
    }
  },
  "effect": {
    "type": "string",
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
  "logsEnabled": {
    "type": "string",
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

output "policydefinition_deploy_diagnostics_activitylog" {
  value = azurerm_policy_definition.deploy_diagnostics_activitylog
}


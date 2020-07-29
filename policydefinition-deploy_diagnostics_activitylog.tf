# This file was auto generated
resource "azurerm_policy_definition" "deploy_diagnostics_activitylog" {
  name         = "Deploy-Diagnostics-ActivityLog"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Diagnostics-ActivityLog"
  description  = "Ensures that Activity Log Diagnostics settings are set to push logs into Log Analytics"

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
    "effect": "deployIfNotExists",
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
              }
            },
            "variables": {},
            "resources": [
              {
                "name": "subscriptionLogsToLogAnalytics",
                "type": "Microsoft.Insights/diagnosticSettings",
                "apiVersion": "2017-05-01-preview",
                "location": "Global",
                "properties": {
                  "workspaceId": "[parameters('logAnalytics')]",
                  "logs": [
                    {
                      "category": "Administrative",
                      "enabled": true
                    },
                    {
                      "category": "Security",
                      "enabled": true
                    },
                    {
                      "category": "ServiceHealth",
                      "enabled": true
                    },
                    {
                      "category": "Alert",
                      "enabled": true
                    },
                    {
                      "category": "Recommendation",
                      "enabled": true
                    },
                    {
                      "category": "Policy",
                      "enabled": true
                    },
                    {
                      "category": "Autoscale",
                      "enabled": true
                    },
                    {
                      "category": "ResourceHealth",
                      "enabled": true
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
            }
          }
        }
      },
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
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
      "description": "Select Log Analytics workspace from dropdown list",
      "strongType": "omsWorkspace"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_diagnostics_activitylog" {
  value = azurerm_policy_definition.deploy_diagnostics_activitylog
}


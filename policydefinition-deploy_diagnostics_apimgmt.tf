# This file was auto generated
resource "azurerm_policy_definition" "deploy_diagnostics_apimgmt" {
  name         = "Deploy-Diagnostics-APIMgmt"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy Diagnostic Settings for API Management to Log Analytics workspace"
  description  = "Deploys the diagnostic settings for API Management to stream to a Log Analytics workspace when any API Management which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled"
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
    "equals": "Microsoft.ApiManagement/service"
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.Insights/diagnosticSettings",
      "name": "setByPolicy",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Insights/diagnosticSettings/logs.enabled",
            "equals": "true"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/metrics.enabled",
            "equals": "true"
          },
          {
            "field": "Microsoft.Insights/diagnosticSettings/workspaceId",
            "equals": "[parameters('logAnalytics')]"
          }
        ]
      },
      "roleDefinitionIds": [
        "/providers/microsoft.authorization/roleDefinitions/749f88d5-cbae-40b8-bcfc-e573ddc772fa",
        "/providers/microsoft.authorization/roleDefinitions/92aaf0da-9dab-42b6-94a3-d43ce8d16293"
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
              },
              "profileName": {
                "type": "string"
              },
              "metricsEnabled": {
                "type": "string"
              },
              "logsEnabled": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.ApiManagement/service/providers/diagnosticSettings",
                "apiVersion": "2017-05-01-preview",
                "name": "[concat(parameters('resourceName'), '/', 'Microsoft.Insights/', parameters('profileName'))]",
                "location": "[parameters('location')]",
                "dependsOn": [],
                "properties": {
                  "workspaceId": "[parameters('logAnalytics')]",
                  "metrics": [
                    {
                      "category": "Gateway Requests",
                      "enabled": "[parameters('metricsEnabled')]",
                      "retentionPolicy": {
                        "days": 0,
                        "enabled": false
                      }
                    },
                    {
                      "category": "Capacity",
                      "enabled": "[parameters('metricsEnabled')]",
                      "retentionPolicy": {
                        "days": 0,
                        "enabled": false
                      }
                    },
                    {
                      "category": "EventHub Events",
                      "enabled": "[parameters('metricsEnabled')]",
                      "retentionPolicy": {
                        "days": 0,
                        "enabled": false
                      }
                    },
                    {
                      "category": "Network Status",
                      "enabled": "[parameters('metricsEnabled')]",
                      "retentionPolicy": {
                        "days": 0,
                        "enabled": false
                      }
                    }
                  ],
                  "logs": [
                    {
                      "category": "GatewayLogs",
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
            "metricsEnabled": {
              "value": "[parameters('metricsEnabled')]"
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
  "profileName": {
    "type": "string",
    "defaultValue": "setbypolicy",
    "metadata": {
      "displayName": "Profile name",
      "description": "The diagnostic settings profile name"
    }
  },
  "metricsEnabled": {
    "type": "string",
    "defaultValue": "True",
    "allowedValues": [
      "True",
      "False"
    ],
    "metadata": {
      "displayName": "Enable metrics",
      "description": "Whether to enable metrics stream to the Log Analytics workspace - True or False"
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

output "policydefinition_deploy_diagnostics_apimgmt" {
  value = azurerm_policy_definition.deploy_diagnostics_apimgmt
}


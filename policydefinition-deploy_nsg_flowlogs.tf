# This file was auto generated
resource "azurerm_policy_definition" "deploy_nsg_flowlogs" {
  name         = "Deploy-Nsg-FlowLogs"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-Nsg-FlowLogs"
  description  = "null"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/networkSecurityGroups"
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Network/networkWatchers/flowLogs",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "name": "[concat('NetworkWatcher_', field('location'), '/', 'Microsoft.Network', resourceGroup().name, field('name'))]",
      "resourceGroupName": "NetworkWatcherRG",
      "existenceCondition": {
        "field": "Microsoft.Network/networkWatchers/flowLogs/enabled",
        "equals": "true"
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "parameters": {
            "networkSecurityGroupName": {
              "value": "[field('name')]"
            },
            "resourceGroupName": {
              "value": "[resourceGroup().name]"
            },
            "location": {
              "value": "[field('location')]"
            },
            "storageAccountResourceId": {
              "value": "[parameters('storageAccountResourceId')]"
            },
            "retention": {
              "value": "[parameters('retention')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "networkSecurityGroupName": {
                "type": "string"
              },
              "resourceGroupName": {
                "type": "string"
              },
              "location": {
                "type": "string"
              },
              "storageAccountResourceId": {
                "type": "string"
              },
              "retention": {
                "type": "int",
                "defaultValue": 5
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Network/networkWatchers/flowLogs",
                "apiVersion": "2019-11-01",
                "name": "[concat('NetworkWatcher_', toLower(parameters('location')), '/', 'flowLogs')]",
                "location": "[parameters('location')]",
                "properties": {
                  "targetResourceId": "[resourceId(parameters('resourceGroupName'), 'Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroupName'))]",
                  "storageId": "[parameters('storageAccountResourceId')]",
                  "enabled": true,
                  "retentionPolicy": {
                    "enabled": true,
                    "days": "[parameters('retention')]"
                  },
                  "format": {
                    "type": "JSON",
                    "version": 2
                  }
                }
              }
            ],
            "outputs": {}
          }
        }
      }
    }
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "retention": {
    "type": "Integer",
    "metadata": {
      "displayName": "Retention"
    }
  },
  "storageAccountResourceId": {
    "type": "String",
    "metadata": {
      "displayName": "Storage Account Resource Id"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_nsg_flowlogs" {
  value = azurerm_policy_definition.deploy_nsg_flowlogs
}


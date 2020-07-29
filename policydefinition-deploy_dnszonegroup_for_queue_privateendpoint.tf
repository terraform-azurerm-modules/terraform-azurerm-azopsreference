# This file was auto generated
resource "azurerm_policy_definition" "deploy_dnszonegroup_for_queue_privateendpoint" {
  name         = "Deploy-DNSZoneGroup-For-Queue-PrivateEndpoint"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Deploy-DNSZoneGroup-For-Queue-PrivateEndpoint"
  description  = "This policy deploys a DNS Zone Group for Storage-Queue Private Endpoint"

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Network/privateEndpoints"
      },
      {
        "count": {
          "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
          "where": {
            "field": "Microsoft.Network/privateEndpoints/privateLinkServiceConnections[*].groupIds[*]",
            "equals": "queue"
          }
        },
        "greaterOrEquals": 1
      }
    ]
  },
  "then": {
    "effect": "deployIfNotExists",
    "details": {
      "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "deployment": {
        "properties": {
          "mode": "incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "privateDnsZoneId": {
                "type": "string"
              },
              "privateEndpointName": {
                "type": "string"
              },
              "location": {
                "type": "string"
              }
            },
            "resources": [
              {
                "name": "[concat(parameters('privateEndpointName'), '/deployedByPolicy')]",
                "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
                "apiVersion": "2020-03-01",
                "location": "[parameters('location')]",
                "properties": {
                  "privateDnsZoneConfigs": [
                    {
                      "name": "storageQueue-privateDnsZone",
                      "properties": {
                        "privateDnsZoneId": "[parameters('privateDnsZoneId')]"
                      }
                    }
                  ]
                }
              }
            ]
          },
          "parameters": {
            "privateDnsZoneId": {
              "value": "[parameters('privateDnsZoneId')]"
            },
            "privateEndpointName": {
              "value": "[field('name')]"
            },
            "location": {
              "value": "[field('location')]"
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
  "privateDnsZoneId": {
    "type": "String",
    "metadata": {
      "displayName": "privateDnsZoneId",
      "strongType": "Microsoft.Network/privateDnsZones"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_dnszonegroup_for_queue_privateendpoint" {
  value = azurerm_policy_definition.deploy_dnszonegroup_for_queue_privateendpoint
}


# This file was auto generated
resource "azurerm_policy_definition" "deploy_dnszonegroup_for_blob_privateendpoint" {
  name         = "Deploy-DNSZoneGroup-For-Blob-PrivateEndpoint"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy DNS Zone Group for Storage-Blob Private Endpoint"
  description  = "Deploys the configurations of a Private DNS Zone Group by a parameter for Storage-Blob Private Endpoint. Used enforce the configuration to a single Private DNS Zone. "
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Network"
}
METADATA

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
            "equals": "blob"
          }
        },
        "greaterOrEquals": 1
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.Network/privateEndpoints/privateDnsZoneGroups",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/4d97b98b-1d4f-4787-a291-c67834d212e7"
      ],
      "deployment": {
        "properties": {
          "mode": "Incremental",
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "privateDnsZoneId": {
                "type": "String"
              },
              "privateEndpointName": {
                "type": "String"
              },
              "location": {
                "type": "String"
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
                      "name": "storageBlob-privateDnsZone",
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
  }
}
PARAMETERS

}

output "policydefinition_deploy_dnszonegroup_for_blob_privateendpoint" {
  value = azurerm_policy_definition.deploy_dnszonegroup_for_blob_privateendpoint
}


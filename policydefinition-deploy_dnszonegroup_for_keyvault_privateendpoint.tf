# This file was auto generated
resource "azurerm_policy_definition" "deploy_dnszonegroup_for_keyvault_privateendpoint" {
  name         = "Deploy-DNSZoneGroup-For-KeyVault-PrivateEndpoint"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy DNS Zone Group for Key Vault Private Endpoint"
  description  = "Deploys the configurations of a Private DNS Zone Group by a parameter for Key Vault Private Endpoint. Used enforce the configuration to a single Private DNS Zone. "
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
            "equals": "vault"
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
                      "name": "keyVault-privateDnsZone",
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
  }
}
PARAMETERS

}

output "policydefinition_deploy_dnszonegroup_for_keyvault_privateendpoint" {
  value = azurerm_policy_definition.deploy_dnszonegroup_for_keyvault_privateendpoint
}


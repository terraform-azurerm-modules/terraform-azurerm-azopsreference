# This file was auto generated
resource "azurerm_policy_definition" "deploy_storage_sslenforcement" {
  name         = "Deploy-Storage-sslEnforcement"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Azure Storage deploy a specific min TLS version requirement and enforce SSL/HTTPS "
  description  = "Deploy a specific min TLS version requirement and enforce SSL on Azure STorage. Enables secure server to client by enforce minimal Tls Version to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Storage"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Storage/storageAccounts"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
            "notEquals": "true"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/minimumTlsVersion",
            "notEquals": "[parameters('minimumTlsVersion')]"
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.DBforPostgreSQL/servers",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
            "equals": "true"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/minimumTlsVersion",
            "equals": "[parameters('minimumTlsVersion')]"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
            "equals": "false"
          }
        ]
      },
      "name": "current",
      "roleDefinitionIds": [
        "/providers/microsoft.authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
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
              "minimumTlsVersion": {
                "type": "String"
              },
              "location": {
                "type": "String"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Storage/storageAccounts",
                "apiVersion": "2019-06-01",
                "name": "[concat(parameters('resourceName'))]",
                "location": "[parameters('location')]",
                "properties": {
                  "supportsHttpsTrafficOnly": true,
                  "minimumTlsVersion": "[parameters('minimumTlsVersion')]"
                }
              }
            ],
            "outputs": {}
          },
          "parameters": {
            "resourceName": {
              "value": "[field('name')]"
            },
            "minimumTlsVersion": {
              "value": "[parameters('minimumTlsVersion')]"
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
  "effect": {
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Effect Azure STorage",
      "description": "Enable or disable the execution of the policy minimum TLS version Azure STorage"
    }
  },
  "minimumTlsVersion": {
    "type": "String",
    "defaultValue": "TLS1_2",
    "allowedValues": [
      "TLS1_2",
      "TLS1_1",
      "TLS1_0"
    ],
    "metadata": {
      "displayName": "Select version for PostgreSQL server",
      "description": "Select version minimum TLS version Azure STorage to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_storage_sslenforcement" {
  value = azurerm_policy_definition.deploy_storage_sslenforcement
}


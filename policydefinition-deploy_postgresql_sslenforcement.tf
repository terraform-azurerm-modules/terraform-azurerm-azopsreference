# This file was auto generated
resource "azurerm_policy_definition" "deploy_postgresql_sslenforcement" {
  name         = "Deploy-PostgreSQL-sslEnforcement"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Azure Database for PostgreSQL server deploy a specific min TLS version requirement and enforce SSL "
  description  = "Deploy a specific min TLS version requirement and enforce SSL on Azure Database for PostgreSQL server. Enables secure server to client by enforce minimal Tls Version to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "SQL"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.DBforPostgreSQL/servers"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.DBforPostgreSQL/servers/sslEnforcement",
            "notEquals": "Enabled"
          },
          {
            "field": "Microsoft.DBforPostgreSQL/servers/minimalTlsVersion",
            "notEquals": "[parameters('minimalTlsVersion')]"
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
            "field": "Microsoft.DBforPostgreSQL/servers/sslEnforcement",
            "equals": "Enabled"
          },
          {
            "field": "Microsoft.DBforPostgreSQL/servers/minimalTlsVersion",
            "equals": "[parameters('minimalTlsVersion')]"
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
              "minimalTlsVersion": {
                "type": "String"
              },
              "location": {
                "type": "String"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.DBforPostgreSQL/servers",
                "apiVersion": "2017-12-01",
                "name": "[concat(parameters('resourceName'))]",
                "location": "[parameters('location')]",
                "properties": {
                  "sslEnforcement": "[if(equals(parameters('minimalTlsVersion'), 'TLSEnforcementDisabled'),'Disabled', 'Enabled')]",
                  "minimalTlsVersion": "[parameters('minimalTlsVersion')]"
                }
              }
            ],
            "outputs": {}
          },
          "parameters": {
            "resourceName": {
              "value": "[field('name')]"
            },
            "minimalTlsVersion": {
              "value": "[parameters('minimalTlsVersion')]"
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
      "displayName": "Effect Azure Database for PostgreSQL server",
      "description": "Enable or disable the execution of the policy minimum TLS version Azure Database for PostgreSQL server"
    }
  },
  "minimalTlsVersion": {
    "type": "String",
    "defaultValue": "TLS1_2",
    "allowedValues": [
      "TLS1_2",
      "TLS1_0",
      "TLS1_1",
      "TLSEnforcementDisabled"
    ],
    "metadata": {
      "displayName": "Select version for PostgreSQL server",
      "description": "Select version minimum TLS version Azure Database for PostgreSQL server to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_postgresql_sslenforcement" {
  value = azurerm_policy_definition.deploy_postgresql_sslenforcement
}


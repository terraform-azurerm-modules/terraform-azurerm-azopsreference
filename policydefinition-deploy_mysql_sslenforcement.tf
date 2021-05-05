# This file was auto generated
resource "azurerm_policy_definition" "deploy_mysql_sslenforcement" {
  name         = "Deploy-MySQL-sslEnforcement"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Azure Database for MySQL server deploy a specific min TLS version and enforce SSL."
  description  = "Deploy a specific min TLS version requirement and enforce SSL on Azure Database for MySQL server. Enforce the Server to client applications using minimum version of Tls to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
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
        "equals": "Microsoft.DBforMySQL/servers"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.DBforMySQL/servers/sslEnforcement",
            "notEquals": "Enabled"
          },
          {
            "field": "Microsoft.DBforMySQL/servers/minimalTlsVersion",
            "notequals": "[parameters('minimalTlsVersion')]"
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.DBforMySQL/servers",
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.DBforMySQL/servers/sslEnforcement",
            "equals": "Enabled"
          },
          {
            "field": "Microsoft.DBforMySQL/servers/minimalTlsVersion",
            "equals": "[parameters('minimalTlsVersion')]"
          }
        ]
      },
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
                "type": "Microsoft.DBforMySQL/servers",
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
      "displayName": "Effect minimum TLS version Azure Database for MySQL server",
      "description": "Enable or disable the execution of the policy minimum TLS version Azure Database for MySQL server"
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
      "displayName": "Select version minimum TLS for MySQL server",
      "description": "Select version minimum TLS version Azure Database for MySQL server to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_mysql_sslenforcement" {
  value = azurerm_policy_definition.deploy_mysql_sslenforcement
}


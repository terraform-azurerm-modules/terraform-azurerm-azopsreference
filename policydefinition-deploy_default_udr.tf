# This file was auto generated
resource "azurerm_policy_definition" "deploy_default_udr" {
  name         = "Deploy-Default-Udr"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy a user-defined route to a VNET with specific routes."
  description  = "Deploy a user-defined route to a VNET with routes from spoke to hub firewall. This policy must be assigned for each region you plan to use."
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
        "equals": "Microsoft.Network/virtualNetworks"
      },
      {
        "field": "location",
        "equals": "[parameters('vnetRegion')]"
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.Network/routeTables",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/4d97b98b-1d4f-4787-a291-c67834d212e7"
      ],
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Network/routeTables/routes[*].nextHopIpAddress",
            "equals": "[parameters('defaultRoute')]"
          }
        ]
      },
      "deployment": {
        "properties": {
          "mode": "incremental",
          "parameters": {
            "udrName": {
              "value": "[concat(field('name'),'-udr')]"
            },
            "udrLocation": {
              "value": "[field('location')]"
            },
            "defaultRoute": {
              "value": "[parameters('defaultRoute')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "udrName": {
                "type": "string"
              },
              "udrLocation": {
                "type": "string"
              },
              "defaultRoute": {
                "type": "string"
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Network/routeTables",
                "name": "[parameters('udrName')]",
                "apiVersion": "2020-08-01",
                "location": "[parameters('udrLocation')]",
                "properties": {
                  "routes": [
                    {
                      "name": "AzureFirewallRoute",
                      "properties": {
                        "addressPrefix": "0.0.0.0/0",
                        "nextHopType": "VirtualAppliance",
                        "nextHopIpAddress": "[parameters('defaultRoute')]"
                      }
                    }
                  ]
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
  "defaultRoute": {
    "type": "String",
    "metadata": {
      "displayName": "Default route to add into UDR",
      "description": "Policy will deploy a default route table to a vnet"
    }
  },
  "vnetRegion": {
    "type": "String",
    "metadata": {
      "displayName": "VNet Region",
      "description": "Regional VNet hub location",
      "strongType": "location"
    }
  },
  "effect": {
    "type": "String",
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    },
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists"
  }
}
PARAMETERS

}

output "policydefinition_deploy_default_udr" {
  value = azurerm_policy_definition.deploy_default_udr
}


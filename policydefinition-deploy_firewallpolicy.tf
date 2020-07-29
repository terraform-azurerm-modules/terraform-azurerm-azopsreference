# This file was auto generated
resource "azurerm_policy_definition" "deploy_firewallpolicy" {
  name         = "Deploy-FirewallPolicy"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy-FirewallPolicy"
  description  = "Deploys Azure Firewall Policy/Manager"

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
      "type": "Microsoft.Network/firewallPolicies",
      "deploymentScope": "Subscription",
      "existenceScope": "ResourceGroup",
      "resourceGroupName": "[parameters('rgName')]",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
      ],
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "rgName": {
              "value": "[parameters('rgName')]"
            },
            "fwPolicy": {
              "value": "[parameters('fwPolicy')]"
            },
            "fwPolicyRegion": {
              "value": "[parameters('fwPolicyRegion')]"
            }
          },
          "template": {
            "$schema": "http://schema.management.azure.com/schemas/2018-05-01/subscriptionDeploymentTemplate.json",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "rgName": {
                "type": "string"
              },
              "fwPolicy": {
                "type": "object"
              },
              "fwPolicyRegion": {
                "type": "string"
              }
            },
            "resources": [
              {
                "type": "Microsoft.Resources/resourceGroups",
                "apiVersion": "2018-05-01",
                "name": "[parameters('rgName')]",
                "location": "[deployment().location]",
                "properties": {}
              },
              {
                "type": "Microsoft.Resources/deployments",
                "apiVersion": "2018-05-01",
                "name": "fwpolicies",
                "resourceGroup": "[parameters('rgName')]",
                "dependsOn": [
                  "[resourceId('Microsoft.Resources/resourceGroups/', parameters('rgName'))]"
                ],
                "properties": {
                  "mode": "Incremental",
                  "template": {
                    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json",
                    "contentVersion": "1.0.0.0",
                    "parameters": {},
                    "variables": {},
                    "resources": [
                      {
                        "type": "Microsoft.Network/firewallPolicies",
                        "apiVersion": "2019-09-01",
                        "name": "[parameters('fwpolicy').firewallPolicyName]",
                        "location": "[parameters('fwpolicy').location]",
                        "dependsOn": [],
                        "tags": {},
                        "properties": {},
                        "resources": [
                          {
                            "type": "ruleGroups",
                            "apiVersion": "2019-09-01",
                            "name": "[parameters('fwpolicy').ruleGroups.name]",
                            "dependsOn": [
                              "[resourceId('Microsoft.Network/firewallPolicies',parameters('fwpolicy').firewallPolicyName)]"
                            ],
                            "properties": {
                              "priority": "[parameters('fwpolicy').ruleGroups.properties.priority]",
                              "rules": "[parameters('fwpolicy').ruleGroups.properties.rules]"
                            }
                          }
                        ]
                      }
                    ],
                    "outputs": {}
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
  "fwpolicy": {
    "type": "Object",
    "metadata": {
      "displayName": "fwpolicy",
      "description": "Object describing Azure Firewall Policy"
    },
    "defaultValue": {}
  },
  "fwPolicyRegion": {
    "type": "String",
    "metadata": {
      "displayName": "fwPolicyRegion",
      "description": "Select Azure region for Azure Firewall Policy",
      "strongType": "location"
    }
  },
  "rgName": {
    "type": "String",
    "metadata": {
      "displayName": "rgName",
      "description": "Provide name for resource group."
    }
  }
}
PARAMETERS

}

output "policydefinition_deploy_firewallpolicy" {
  value = azurerm_policy_definition.deploy_firewallpolicy
}


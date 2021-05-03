# This file was auto generated
resource "azurerm_policy_definition" "deploy_asc_defender_sql" {
  name         = "Deploy-ASC-Defender-Sql"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy Azure Defender for Azure Sql Databases"
  description  = "Deploy the Azure Defender settings in Azure Security Center for Azure Sql Databases"
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Security Center"
}
METADATA

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
    "effect": "[parameters('effect')]",
    "details": {
      "type": "Microsoft.Security/pricings",
      "name": "SqlServers",
      "deploymentScope": "Subscription",
      "existenceScope": "Subscription",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/fb1c8493-542b-48eb-b624-b4c8fea62acd"
      ],
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Security/pricings/pricingTier",
            "equals": "[parameters('pricingTier')]"
          },
          {
            "field": "type",
            "equals": "Microsoft.Security/pricings"
          }
        ]
      },
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "pricingTier": {
              "value": "[parameters('pricingTier')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "pricingTier": {
                "type": "string",
                "metadata": {
                  "description": "Azure Defender pricing tier"
                }
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Security/pricings",
                "apiVersion": "2018-06-01",
                "name": "SqlServers",
                "properties": {
                  "pricingTier": "[parameters('pricingTier')]"
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
  "pricingTier": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier",
      "description": "Azure Defender pricing tier"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
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

output "policydefinition_deploy_asc_defender_sql" {
  value = azurerm_policy_definition.deploy_asc_defender_sql
}


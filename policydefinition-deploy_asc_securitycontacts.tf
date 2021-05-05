# This file was auto generated
resource "azurerm_policy_definition" "deploy_asc_securitycontacts" {
  name         = "Deploy-ASC-SecurityContacts"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deploy Azure Security Center Security Contacts"
  description  = "Deploy Azure Security Center Security Contacts"
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
      "type": "Microsoft.Security/securityContacts",
      "deploymentScope": "Subscription",
      "existenceScope": "Subscription",
      "roleDefinitionIds": [
        "/providers/Microsoft.Authorization/roleDefinitions/fb1c8493-542b-48eb-b624-b4c8fea62acd"
      ],
      "existenceCondition": {
        "allOf": [
          {
            "field": "Microsoft.Security/securityContacts/email",
            "contains": "[parameters('emailSecurityContact')]"
          },
          {
            "field": "type",
            "equals": "Microsoft.Security/securityContacts"
          },
          {
            "field": "Microsoft.Security/securityContacts/alertNotifications",
            "equals": "On"
          },
          {
            "field": "Microsoft.Security/securityContacts/alertsToAdmins",
            "equals": "On"
          }
        ]
      },
      "deployment": {
        "location": "northeurope",
        "properties": {
          "mode": "incremental",
          "parameters": {
            "emailSecurityContact": {
              "value": "[parameters('emailSecurityContact')]"
            }
          },
          "template": {
            "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
            "contentVersion": "1.0.0.0",
            "parameters": {
              "emailSecurityContact": {
                "type": "string",
                "metadata": {
                  "description": "Security contacts email address"
                }
              }
            },
            "variables": {},
            "resources": [
              {
                "type": "Microsoft.Security/securityContacts",
                "name": "default",
                "apiVersion": "2020-01-01-preview",
                "properties": {
                  "emails": "[parameters('emailSecurityContact')]",
                  "notificationsByRole": {
                    "state": "On",
                    "roles": [
                      "Owner"
                    ]
                  },
                  "alertNotifications": {
                    "state": "On",
                    "minimalSeverity": "High"
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
  "emailSecurityContact": {
    "type": "string",
    "metadata": {
      "displayName": "Security contacts email address",
      "description": "Provide email address for Azure Security Center contact details"
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

output "policydefinition_deploy_asc_securitycontacts" {
  value = azurerm_policy_definition.deploy_asc_securitycontacts
}


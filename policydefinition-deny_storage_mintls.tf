# This file was auto generated
resource "azurerm_policy_definition" "deny_storage_mintls" {
  name         = "Deny-Storage-minTLS"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Storage Account set to minumum TLS and Secure transfer should be enabled"
  description  = "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
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
            "allOf": [
              {
                "value": "[requestContext().apiVersion]",
                "less": "2019-04-01"
              },
              {
                "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
                "exists": "false"
              }
            ]
          },
          {
            "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
            "equals": "false"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/minimumTlsVersion",
            "notequals": "[parameters('minimumTlsVersion')]"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/minimumTlsVersion",
            "exists": "false"
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]"
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "effect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Effect",
      "description": "The effect determines what happens when the policy rule is evaluated to match"
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
      "displayName": "Storage Account select minimum TLS version",
      "description": "Select version minimum TLS version on Azure Storage Account to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_deny_storage_mintls" {
  value = azurerm_policy_definition.deny_storage_mintls
}


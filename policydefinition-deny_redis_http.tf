# This file was auto generated
resource "azurerm_policy_definition" "deny_redis_http" {
  name         = "Deny-Redis-http"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Azure Cache for Redis only secure connections should be enabled"
  description  = "Audit enabling of only connections via SSL to Azure Cache for Redis. Validate both minimum TLS version and enableNonSslPort is disabled. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Cache"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Cache/redis"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.Cache/Redis/enableNonSslPort",
            "equals": "true"
          },
          {
            "field": "Microsoft.Cache/Redis/minimumTlsVersion",
            "notequals": "[parameters('minimumTlsVersion')]"
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
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.1",
      "1.0"
    ],
    "metadata": {
      "displayName": "Select minumum TLS version for Azure Cache for Redis.",
      "description": "Select minimum TLS version for Azure Cache for Redis."
    }
  }
}
PARAMETERS

}

output "policydefinition_deny_redis_http" {
  value = azurerm_policy_definition.deny_redis_http
}


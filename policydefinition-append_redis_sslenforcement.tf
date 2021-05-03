# This file was auto generated
resource "azurerm_policy_definition" "append_redis_sslenforcement" {
  name         = "Append-Redis-sslEnforcement"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Azure Cache for Redis Append a specific min TLS version requirement and enforce TLS."
  description  = "Append a specific min TLS version requirement and enforce SSL on Azure Cache for Redis. Enables secure server to client by enforce minimal Tls Version to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
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
            "field": "Microsoft.Cache/Redis/minimumTlsVersion",
            "notequals": "[parameters('minimumTlsVersion')]"
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": [
      {
        "field": "Microsoft.Cache/Redis/minimumTlsVersion",
        "value": "[parameters('minimumTlsVersion')]"
      }
    ]
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "effect": {
    "type": "String",
    "defaultValue": "Append",
    "allowedValues": [
      "Append",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Effect Azure Cache for Redis",
      "description": "Enable or disable the execution of the policy minimum TLS version Azure Cache for Redis"
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
      "displayName": "Select version for Redis server",
      "description": "Select version minimum TLS version Azure Cache for Redis to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_append_redis_sslenforcement" {
  value = azurerm_policy_definition.append_redis_sslenforcement
}


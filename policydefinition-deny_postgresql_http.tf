# This file was auto generated
resource "azurerm_policy_definition" "deny_postgresql_http" {
  name         = "Deny-PostgreSql-http"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "PostgreSQL database servers enforce SSL connection."
  description  = "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
  metadata     = <<METADATA
{
  "version": "1.0.1",
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
            "exists": "false"
          },
          {
            "field": "Microsoft.DBforPostgreSQL/servers/sslEnforcement",
            "notEquals": "Enabled"
          },
          {
            "field": "Microsoft.DBforPostgreSQL/servers/minimalTlsVersion",
            "notequals": "[parameters('minimalTlsVersion')]"
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
      "Disabled",
      "Deny"
    ],
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
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

output "policydefinition_deny_postgresql_http" {
  value = azurerm_policy_definition.deny_postgresql_http
}


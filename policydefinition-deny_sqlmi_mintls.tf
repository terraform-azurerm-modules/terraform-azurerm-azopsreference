# This file was auto generated
resource "azurerm_policy_definition" "deny_sqlmi_mintls" {
  name         = "Deny-SqlMi-minTLS"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "SQL Managed Instance should have the minimal TLS version set to the highest version"
  description  = "Setting minimal TLS version to 1.2 improves security by ensuring your SQL Managed Instance can only be accessed from clients using TLS 1.2. Using versions of TLS less than 1.2 is not reccomended since they have well documented security vunerabilities."
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
        "equals": "Microsoft.Sql/managedInstances"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.Sql/managedInstances/minimalTlsVersion",
            "exists": "false"
          },
          {
            "field": "Microsoft.Sql/managedInstances/minimalTlsVersion",
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
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    },
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ],
    "defaultValue": "Audit"
  },
  "minimalTlsVersion": {
    "type": "String",
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.1",
      "1.0"
    ],
    "metadata": {
      "displayName": "Select version for SQL server",
      "description": "Select version minimum TLS version SQL servers to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_deny_sqlmi_mintls" {
  value = azurerm_policy_definition.deny_sqlmi_mintls
}


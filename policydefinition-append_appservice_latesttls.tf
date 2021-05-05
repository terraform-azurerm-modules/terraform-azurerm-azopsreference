# This file was auto generated
resource "azurerm_policy_definition" "append_appservice_latesttls" {
  name         = "Append-AppService-latestTLS"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "AppService append sites with minimum TLS version to enforce."
  description  = "Append the AppService sites object to ensure that min Tls version is set to required minimum TLS version. Please note Append does not enforce compliance use then deny."
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "App Service"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Web/sites/config"
      },
      {
        "field": "Microsoft.Web/sites/config/minTlsVersion",
        "notEquals": "[parameters('minTlsVersion')]"
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": [
      {
        "field": "Microsoft.Web/sites/config/minTlsVersion",
        "value": "[parameters('minTlsVersion')]"
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
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    }
  },
  "minTlsVersion": {
    "type": "String",
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.0",
      "1.1"
    ],
    "metadata": {
      "displayName": "Select version minimum TLS Web App config",
      "description": "Select version minimum TLS version for a Web App config to enforce"
    }
  }
}
PARAMETERS

}

output "policydefinition_append_appservice_latesttls" {
  value = azurerm_policy_definition.append_appservice_latesttls
}


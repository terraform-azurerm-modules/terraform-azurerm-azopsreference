# This file was auto generated
resource "azurerm_policy_definition" "append_appservice_httpsonly" {
  name         = "Append-AppService-httpsonly"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "AppService append enable https only setting to enforce https setting."
  description  = "Appends the AppService sites object to ensure that HTTPS only is enabled for server/service authentication and protects data in transit from network layer eavesdropping attacks. Please note Append does not enforce compliance use then deny."
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
        "equals": "Microsoft.Web/sites"
      },
      {
        "field": "Microsoft.Web/sites/httpsOnly",
        "notequals": true
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]",
    "details": [
      {
        "field": "Microsoft.Web/sites/httpsOnly",
        "value": true
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
  }
}
PARAMETERS

}

output "policydefinition_append_appservice_httpsonly" {
  value = azurerm_policy_definition.append_appservice_httpsonly
}


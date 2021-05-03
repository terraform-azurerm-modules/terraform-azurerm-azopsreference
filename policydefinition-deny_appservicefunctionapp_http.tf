# This file was auto generated
resource "azurerm_policy_definition" "deny_appservicefunctionapp_http" {
  name         = "Deny-AppServiceFunctionApp-http"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Function App should only be accessible over HTTPS"
  description  = "Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
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
        "field": "kind",
        "like": "functionapp*"
      },
      {
        "field": "Microsoft.Web/sites/httpsOnly",
        "equals": "false"
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
  }
}
PARAMETERS

}

output "policydefinition_deny_appservicefunctionapp_http" {
  value = azurerm_policy_definition.deny_appservicefunctionapp_http
}


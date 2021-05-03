# This file was auto generated
resource "azurerm_policy_definition" "deny_aa_child_resources" {
  name         = "Deny-AA-child-resources"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "No child resources in Automation Account"
  description  = "This policy denies the creation of child resources on the Automation Account"
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Automation"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "in": [
          "Microsoft.Automation/automationAccounts/runbooks",
          "Microsoft.Automation/automationAccounts/variables",
          "Microsoft.Automation/automationAccounts/modules",
          "Microsoft.Automation/automationAccounts/credentials",
          "Microsoft.Automation/automationAccounts/connections",
          "Microsoft.Automation/automationAccounts/certificates"
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
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "defaultValue": "Deny",
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    }
  }
}
PARAMETERS

}

output "policydefinition_deny_aa_child_resources" {
  value = azurerm_policy_definition.deny_aa_child_resources
}


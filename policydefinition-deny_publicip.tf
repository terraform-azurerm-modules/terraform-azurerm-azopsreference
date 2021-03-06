# This file was auto generated
resource "azurerm_policy_definition" "deny_publicip" {
  name         = "Deny-PublicIP"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny the creation of public IP"
  description  = "This policy denies creation of Public IPs under the assigned scope."
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Network"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "field": "type",
    "equals": "Microsoft.Network/publicIPAddresses"
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

output "policydefinition_deny_publicip" {
  value = azurerm_policy_definition.deny_publicip
}


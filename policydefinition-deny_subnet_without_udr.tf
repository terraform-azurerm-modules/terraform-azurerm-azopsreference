# This file was auto generated
resource "azurerm_policy_definition" "deny_subnet_without_udr" {
  name         = "Deny-Subnet-Without-UDR"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Subnets should have a User Defined Route"
  description  = "This policy denies the creation of a subsnet with out a User Defined Route."
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
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.Network/virtualNetworks/subnets"
      },
      {
        "field": "Microsoft.Network/virtualNetworks/subnets/routeTable.id",
        "exists": "false"
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
      "Deny",
      "Disabled"
    ],
    "defaultValue": "Deny"
  }
}
PARAMETERS

}

output "policydefinition_deny_subnet_without_udr" {
  value = azurerm_policy_definition.deny_subnet_without_udr
}


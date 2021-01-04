# This file was auto generated
resource "azurerm_policy_definition" "deny_subnet_without_nsg" {
  name         = "Deny-Subnet-Without-Nsg"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Subnets should have a Network Security Group "
  description  = "This policy denies the creation of a subsnet with out an Network Security Group. NSG help to protect traffic across subnet-level."

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
        "field": "Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup.id",
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

output "policydefinition_deny_subnet_without_nsg" {
  value = azurerm_policy_definition.deny_subnet_without_nsg
}


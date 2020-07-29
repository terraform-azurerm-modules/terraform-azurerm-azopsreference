# This file was auto generated
resource "azurerm_policy_definition" "deny_subnet_without_nsg" {
  name         = "Deny-Subnet-Without-Nsg"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-Subnets-Without-NSG"
  description  = "null"

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
    "effect": "deny"
  }
}
POLICYRULE


}

output "policydefinition_deny_subnet_without_nsg" {
  value = azurerm_policy_definition.deny_subnet_without_nsg
}


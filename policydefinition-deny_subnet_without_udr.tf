# This file was auto generated
resource "azurerm_policy_definition" "deny_subnet_without_udr" {
  name         = "Deny-Subnet-Without-UDR"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-Subnets-Without-UDR"
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
        "field": "Microsoft.Network/virtualNetworks/subnets/routeTable.id",
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

output "policydefinition_deny_subnet_without_udr" {
  value = azurerm_policy_definition.deny_subnet_without_udr
}


# This file was auto generated
resource "azurerm_policy_definition" "append_kv_softdelete" {
  name         = "Append-KV-SoftDelete"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Append-KV-SoftDelete"
  description  = "When a Key Vault is created with out soft delete enabled then this will add it."

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "anyOf": [
      {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.KeyVault/vaults"
          },
          {
            "field": "Microsoft.KeyVault/vaults/enableSoftDelete",
            "notEquals": false
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "append",
    "details": [
      {
        "field": "Microsoft.KeyVault/vaults/enableSoftDelete",
        "value": true
      }
    ]
  }
}
POLICYRULE


}

output "policydefinition_append_kv_softdelete" {
  value = azurerm_policy_definition.append_kv_softdelete
}


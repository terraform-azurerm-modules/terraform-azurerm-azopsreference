# This file was auto generated
resource "azurerm_policy_set_definition" "deny_publicendpoints" {
  name                  = "Deny-PublicEndpoints"
  policy_type           = "Custom"
  display_name          = "Deny-Public-Endpoints-for-PaaS-Services"
  description           = "null"
  management_group_name = var.management_group_name
  depends_on = [
    azurerm_policy_definition.deny_publicendpoint_aks,
    azurerm_policy_definition.deny_publicendpoint_cosmosdb,
    azurerm_policy_definition.deny_publicendpoint_keyvault,
    azurerm_policy_definition.deny_publicendpoint_mariadb,
    azurerm_policy_definition.deny_publicendpoint_mysql,
    azurerm_policy_definition.deny_publicendpoint_postgresql,
    azurerm_policy_definition.deny_publicendpoint_sql,
    azurerm_policy_definition.deny_publicendpoint_storage,
  ]
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-CosmosDB"
    reference_id         = "DenyPublicEndpointCosmosDB"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MariaDB"
    reference_id         = "DenyPublicEndpointMariaDB"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MySQL"
    reference_id         = "DenyPublicEndpointMySQL"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-PostgreSql"
    reference_id         = "DenyPublicEndpointPostgreSql"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-KeyVault"
    reference_id         = "DenyPublicEndpointKeyVault"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Sql"
    reference_id         = "DenyPublicEndpointSql"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Storage"
    reference_id         = "DenyPublicEndpointStorage"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Aks"
    reference_id         = "DenyPublicEndpointAks"
    parameters = {
    }
  }

}

output "policysetdefinition_deny_publicendpoints" {
  value = azurerm_policy_set_definition.deny_publicendpoints
}

output "policysetdefinition_deny_publicendpoints_definitions" {
  value = [
    azurerm_policy_definition.deny_publicendpoint_aks,
    azurerm_policy_definition.deny_publicendpoint_cosmosdb,
    azurerm_policy_definition.deny_publicendpoint_keyvault,
    azurerm_policy_definition.deny_publicendpoint_mariadb,
    azurerm_policy_definition.deny_publicendpoint_mysql,
    azurerm_policy_definition.deny_publicendpoint_postgresql,
    azurerm_policy_definition.deny_publicendpoint_sql,
    azurerm_policy_definition.deny_publicendpoint_storage,
  ]
}


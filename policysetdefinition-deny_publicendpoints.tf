# This file was auto generated
resource "azurerm_policy_set_definition" "deny_publicendpoints" {
  name                  = "Deny-PublicEndpoints"
  policy_type           = "Custom"
  display_name          = "Public network access should be disabled for PAAS services"
  description           = "This policy denies creation of Azure PAAS services with exposed public endpoints. This policy set includes the policy for the following services KeyVault, Storage accounts, AKS, Cosmos, SQL Servers, MariaDB, MySQL and Postgress. "
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
    reference_id         = "CosmosDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('CosmosPublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MariaDB"
    reference_id         = "MariaDBDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('MariaDBPublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-MySQL"
    reference_id         = "MySQLDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('MySQLPublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-PostgreSql"
    reference_id         = "PostgreSQLDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('PostgreSQLPublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-KeyVault"
    reference_id         = "KeyVaultDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('KeyVaultPublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Sql"
    reference_id         = "SqlServerDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SqlServerPublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Storage"
    reference_id         = "StorageDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('StoragePublicIpDenyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PublicEndpoint-Aks"
    reference_id         = "AKSDenyPaasPublicIP"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('AKSPublicIpDenyEffect')]"
  }
}
VALUES
  }

  parameters = <<PARAMETERS
{
  "CosmosPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access should be disabled for CosmosDB",
      "description": "This policy denies that Cosmos database accounts are created with out public network access is disabled."
    }
  },
  "MariaDBPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access should be disabled for MariaDB",
      "description": "This policy denies the creation of Maria DB accounts with exposed public endpoints"
    }
  },
  "MySQLPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access should be disabled for MySQL",
      "description": "This policy denies creation of MySql DB accounts with exposed public endpoints"
    }
  },
  "PostgreSQLPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access should be disabled for PostgreSql",
      "description": "This policy denies creation of Postgre SQL DB accounts with exposed public endpoints"
    }
  },
  "KeyVaultPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access should be disabled for KeyVault",
      "description": "This policy denies creation of Key Vaults with IP Firewall exposed to all public endpoints"
    }
  },
  "SqlServerPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access on Azure SQL Database should be disabled",
      "description": "This policy denies creation of Sql servers with exposed public endpoints"
    }
  },
  "StoragePublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access onStorage accounts should be disabled",
      "description": "This policy denies creation of storage accounts with IP Firewall exposed to all public endpoints"
    }
  },
  "AKSPublicIpDenyEffect": {
    "type": "String",
    "defaultValue": "Deny",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Public network access on AKS API should be disabled",
      "description": "This policy denies the creation of Azure Kubernetes Service non-private clusters"
    }
  }
}
PARAMETERS
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


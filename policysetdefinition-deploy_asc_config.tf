# This file was auto generated
resource "azurerm_policy_set_definition" "deploy_asc_config" {
  name                  = "Deploy-ASC-Config"
  policy_type           = "Custom"
  display_name          = "Deploy Azure Security Center configuration"
  description           = "Deploy Azure Security Center configuration"
  management_group_name = var.management_group_name
  depends_on = [
    azurerm_policy_definition.deploy_asc_defender_acr,
    azurerm_policy_definition.deploy_asc_defender_aks,
    azurerm_policy_definition.deploy_asc_defender_akv,
    azurerm_policy_definition.deploy_asc_defender_appsrv,
    azurerm_policy_definition.deploy_asc_defender_arm,
    azurerm_policy_definition.deploy_asc_defender_dns,
    azurerm_policy_definition.deploy_asc_defender_sa,
    azurerm_policy_definition.deploy_asc_defender_sql,
    azurerm_policy_definition.deploy_asc_defender_sqlvm,
    azurerm_policy_definition.deploy_asc_defender_vms,
    azurerm_policy_definition.deploy_asc_securitycontacts,
  ]

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-VMs"
    reference_id         = "defenderForVM"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierVMs')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-Sql"
    reference_id         = "defenderForSqlServers"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierSqlServers')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-AppSrv"
    reference_id         = "defenderForAppServices"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierAppServices')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-SA"
    reference_id         = "defenderForStorageAccounts"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierStorageAccounts')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-SQLVM"
    reference_id         = "defenderForSqlServerVirtualMachines"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierSqlServerVirtualMachines')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-AKS"
    reference_id         = "defenderForKubernetesService"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierKubernetesService')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-ACR"
    reference_id         = "defenderForContainerRegistry"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierContainerRegistry')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-AKV"
    reference_id         = "defenderForKeyVaults"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierKeyVaults')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-DNS"
    reference_id         = "defenderForDns"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierDns')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-Defender-ARM"
    reference_id         = "defenderForArm"
    parameter_values     = <<VALUES
{
  "pricingTier": {
    "value": "[parameters('pricingTierArm')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-SecurityContacts"
    reference_id         = "securityEmailContact"
    parameter_values     = <<VALUES
{
  "emailSecurityContact": {
    "value": "[parameters('emailSecurityContact')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ffb6f416-7bd2-4488-8828-56585fef2be9"
    reference_id         = "ascExport"
    parameter_values     = <<VALUES
{
  "resourceGroupName": {
    "value": "[parameters('ascExportResourceGroupName')]"
  },
  "resourceGroupLocation": {
    "value": "[parameters('ascExportResourceGroupLocation')]"
  },
  "workspaceResourceId": {
    "value": "[parameters('logAnalytics')]"
  }
}
VALUES
  }

  parameters = <<PARAMETERS
{
  "emailSecurityContact": {
    "type": "string",
    "metadata": {
      "displayName": "Security contacts email address",
      "description": "Provide email address for Azure Security Center contact details"
    }
  },
  "logAnalytics": {
    "type": "String",
    "metadata": {
      "displayName": "Primary Log Analytics workspace",
      "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
      "strongType": "omsWorkspace"
    }
  },
  "ascExportResourceGroupName": {
    "type": "String",
    "metadata": {
      "displayName": "Resource Group name for the export to Log Analytics workspace configuration",
      "description": "The resource group name where the export to Log Analytics workspace configuration is created. If you enter a name for a resource group that doesn't exist, it'll be created in the subscription. Note that each resource group can only have one export to Log Analytics workspace configured."
    }
  },
  "ascExportResourceGroupLocation": {
    "type": "String",
    "metadata": {
      "displayName": "Resource Group location for the export to Log Analytics workspace configuration",
      "description": "The location where the resource group and the export to Log Analytics workspace configuration are created."
    }
  },
  "pricingTierVMs": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for Virtual Machines",
      "description": "Azure Defender pricing tier for Virtual Machines"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierSqlServers": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for SQL Servers",
      "description": "Azure Defender pricing tier for SQL Servers"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierAppServices": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for App Services",
      "description": "Azure Defender pricing tier for App Services"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierStorageAccounts": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for Storage Accounts",
      "description": "Azure Defender pricing tier for Storage Accounts"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierSqlServerVirtualMachines": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for SQL Server Virtual Machines",
      "description": "Azure Defender pricing tier for SQL Server Virtual Machines"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierKubernetesService": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for AKS",
      "description": "Azure Defender pricing tier for AKS"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierContainerRegistry": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for ACR",
      "description": "Azure Defender pricing tier for ACR"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierKeyVaults": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for AKV",
      "description": "Azure Defender pricing tier for AKV"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierDns": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for DNS",
      "description": "Azure Defender pricing tier for DNS"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  },
  "pricingTierArm": {
    "type": "string",
    "metadata": {
      "displayName": "Azure Defender pricing tier for Azure Resource Manager",
      "description": "Azure Defender pricing tier for Azure Resource Manager"
    },
    "allowedValues": [
      "Standard",
      "Free"
    ],
    "defaultValue": "Standard"
  }
}
PARAMETERS
}

output "policysetdefinition_deploy_asc_config" {
  value = azurerm_policy_set_definition.deploy_asc_config
}

output "policysetdefinition_deploy_asc_config_definitions" {
  value = [
    azurerm_policy_definition.deploy_asc_defender_acr,
    azurerm_policy_definition.deploy_asc_defender_aks,
    azurerm_policy_definition.deploy_asc_defender_akv,
    azurerm_policy_definition.deploy_asc_defender_appsrv,
    azurerm_policy_definition.deploy_asc_defender_arm,
    azurerm_policy_definition.deploy_asc_defender_dns,
    azurerm_policy_definition.deploy_asc_defender_sa,
    azurerm_policy_definition.deploy_asc_defender_sql,
    azurerm_policy_definition.deploy_asc_defender_sqlvm,
    azurerm_policy_definition.deploy_asc_defender_vms,
    azurerm_policy_definition.deploy_asc_securitycontacts,
  ]
}


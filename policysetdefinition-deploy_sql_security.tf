# This file was auto generated
resource "azurerm_policy_set_definition" "deploy_sql_security" {
  name                  = "Deploy-Sql-Security"
  policy_type           = "Custom"
  display_name          = "Deploy SQL Database built-in SQL security configuration"
  description           = "Deploy auditing, Alert, TDE and SQL vulnerability to SQL Databases when it not exist in the deployment"
  management_group_name = var.management_group_name
  depends_on = [
    azurerm_policy_definition.deploy_sql_auditingsettings,
    azurerm_policy_definition.deploy_sql_securityalertpolicies,
    azurerm_policy_definition.deploy_sql_tde,
    azurerm_policy_definition.deploy_sql_vulnerabilityassessments,
  ]

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-Tde"
    reference_id         = "DeploySqlTde"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SqlDbTdeDeploySqlSecurityEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies"
    reference_id         = "DeploySqlSecurityAlertPolicies"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SqlDbSecurityAlertPoliciesDeploySqlSecurityEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings"
    reference_id         = "DeploySqlAuditingSettings"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SqlDbAuditingSettingsDeploySqlSecurityEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments"
    reference_id         = "DeploySqlvulnerabilityAssessments"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SqlDbVulnerabilityAssessmentsDeploySqlSecurityEffect')]"
  },
  "vulnerabilityAssessmentsEmail": {
    "value": "[parameters('vulnerabilityAssessmentsEmail')]"
  },
  "vulnerabilityAssessmentsStorageID": {
    "value": "[parameters('vulnerabilityAssessmentsStorageID')]"
  }
}
VALUES
  }

  parameters = <<PARAMETERS
{
  "SqlDbAuditingSettingsDeploySqlSecurityEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploy auditing settings to SQL Database when it not exist in the deployment",
      "displayName": "Deploy SQL database auditing settings"
    },
    "type": "String"
  },
  "SqlDbSecurityAlertPoliciesDeploySqlSecurityEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploy the security Alert Policies configuration with email admin accounts when it not exist in current configuration",
      "displayName": "Deploy SQL Database security Alert Policies configuration with email admin accounts"
    },
    "type": "String"
  },
  "SqlDbTdeDeploySqlSecurityEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploy the Transparent Data Encryption when it is not enabled in the deployment",
      "displayName": "Deploy SQL Database Transparent Data Encryption "
    },
    "type": "String"
  },
  "SqlDbVulnerabilityAssessmentsDeploySqlSecurityEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploy SQL Database vulnerability Assessments when it not exist in the deployment. To the specific storage account in the parameters",
      "displayName": "Deploy SQL Database vulnerability Assessments"
    },
    "type": "String"
  },
  "vulnerabilityAssessmentsEmail": {
    "metadata": {
      "description": "The email address to send alerts",
      "displayName": "The email address to send alerts"
    },
    "type": "String"
  },
  "vulnerabilityAssessmentsStorageID": {
    "metadata": {
      "description": "The storage account ID to store assessments",
      "displayName": "The storage account ID to store assessments"
    },
    "type": "String"
  }
}
PARAMETERS
}

output "policysetdefinition_deploy_sql_security" {
  value = azurerm_policy_set_definition.deploy_sql_security
}

output "policysetdefinition_deploy_sql_security_definitions" {
  value = [
    azurerm_policy_definition.deploy_sql_auditingsettings,
    azurerm_policy_definition.deploy_sql_securityalertpolicies,
    azurerm_policy_definition.deploy_sql_tde,
    azurerm_policy_definition.deploy_sql_vulnerabilityassessments,
  ]
}


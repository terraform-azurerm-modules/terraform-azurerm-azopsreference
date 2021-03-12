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
    reference_id         = "SqlDbTdeDeploySqlSecurity"
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
    reference_id         = "SqlDbSecurityAlertPoliciesDeploySqlSecurity"
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
    reference_id         = "SqlDbAuditingSettingsDeploySqlSecurity"
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
    reference_id         = "SqlDbVulnerabilityAssessmentsDeploySqlSecurity"
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
  },
  "SqlDbTdeDeploySqlSecurityEffect": {
    "type": "string",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Deploy SQL Database Transparent Data Encryption ",
      "description": "Deploy the Transparent Data Encryption when it is not enabled in the deployment"
    }
  },
  "SqlDbSecurityAlertPoliciesDeploySqlSecurityEffect": {
    "type": "string",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Deploy SQL Database security Alert Policies configuration with email admin accounts",
      "description": "Deploy the security Alert Policies configuration with email admin accounts when it not exist in current configuration"
    }
  },
  "SqlDbAuditingSettingsDeploySqlSecurityEffect": {
    "type": "string",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Deploy SQL database auditing settings",
      "description": "Deploy auditing settings to SQL Database when it not exist in the deployment"
    }
  },
  "SqlDbVulnerabilityAssessmentsDeploySqlSecurityEffect": {
    "type": "string",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Deploy SQL Database vulnerability Assessments",
      "description": "Deploy SQL Database vulnerability Assessments when it not exist in the deployment. To the specific storage account in the parameters"
    }
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


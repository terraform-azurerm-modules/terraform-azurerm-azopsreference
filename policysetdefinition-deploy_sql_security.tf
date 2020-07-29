# This file was auto generated
resource "azurerm_policy_set_definition" "deploy_sql_security" {
  name                  = "Deploy-Sql-Security"
  policy_type           = "Custom"
  display_name          = "Deploy-Sql-Security"
  description           = "Recommended built-in security policies for the North Star architecture"
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
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies"
    reference_id         = "DeploySqlSecurityAlertPolicies"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings"
    reference_id         = "DeploySqlAuditingSettings"
    parameters = {
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments"
    reference_id         = "DeploySqlvulnerabilityAssessments"
    parameters = {
      vulnerabilityAssessmentsEmail     = "[parameters('vulnerabilityAssessmentsEmail')]"
      vulnerabilityAssessmentsStorageID = "[parameters('vulnerabilityAssessmentsStorageID')]"
    }
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
      "description": "The storage account to store assessments",
      "displayName": "The storage account to store assessments"
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


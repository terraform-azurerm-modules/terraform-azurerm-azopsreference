# This file was auto generated
resource "azurerm_policy_set_definition" "deploy_diag_loganalytics" {
  name                  = "Deploy-Diag-LogAnalytics"
  policy_type           = "Custom"
  display_name          = "Deploy Diagnostic Settings to Azure Services"
  description           = "This policy set deploys the configurations of application Azure resources to forward diagnostic logs and metrics to an Azure Log Analytics workspace. See the list of policies of the services that are included "
  management_group_name = var.management_group_name
  depends_on = [
    azurerm_policy_definition.deploy_diagnostics_aa,
    azurerm_policy_definition.deploy_diagnostics_aci,
    azurerm_policy_definition.deploy_diagnostics_acr,
    azurerm_policy_definition.deploy_diagnostics_aks,
    azurerm_policy_definition.deploy_diagnostics_analysisservice,
    azurerm_policy_definition.deploy_diagnostics_apimgmt,
    azurerm_policy_definition.deploy_diagnostics_applicationgateway,
    azurerm_policy_definition.deploy_diagnostics_batch,
    azurerm_policy_definition.deploy_diagnostics_cdnendpoints,
    azurerm_policy_definition.deploy_diagnostics_cognitiveservices,
    azurerm_policy_definition.deploy_diagnostics_cosmosdb,
    azurerm_policy_definition.deploy_diagnostics_databricks,
    azurerm_policy_definition.deploy_diagnostics_datafactory,
    azurerm_policy_definition.deploy_diagnostics_datalakestore,
    azurerm_policy_definition.deploy_diagnostics_dlanalytics,
    azurerm_policy_definition.deploy_diagnostics_eventgridsub,
    azurerm_policy_definition.deploy_diagnostics_eventgridsystemtopic,
    azurerm_policy_definition.deploy_diagnostics_eventgridtopic,
    azurerm_policy_definition.deploy_diagnostics_eventhub,
    azurerm_policy_definition.deploy_diagnostics_expressroute,
    azurerm_policy_definition.deploy_diagnostics_firewall,
    azurerm_policy_definition.deploy_diagnostics_frontdoor,
    azurerm_policy_definition.deploy_diagnostics_function,
    azurerm_policy_definition.deploy_diagnostics_hdinsight,
    azurerm_policy_definition.deploy_diagnostics_iothub,
    azurerm_policy_definition.deploy_diagnostics_keyvault,
    azurerm_policy_definition.deploy_diagnostics_loadbalancer,
    azurerm_policy_definition.deploy_diagnostics_logicappsise,
    azurerm_policy_definition.deploy_diagnostics_logicappswf,
    azurerm_policy_definition.deploy_diagnostics_mariadb,
    azurerm_policy_definition.deploy_diagnostics_mlworkspace,
    azurerm_policy_definition.deploy_diagnostics_mysql,
    azurerm_policy_definition.deploy_diagnostics_networksecuritygroups,
    azurerm_policy_definition.deploy_diagnostics_nic,
    azurerm_policy_definition.deploy_diagnostics_postgresql,
    azurerm_policy_definition.deploy_diagnostics_powerbiembedded,
    azurerm_policy_definition.deploy_diagnostics_publicip,
    azurerm_policy_definition.deploy_diagnostics_recoveryvault,
    azurerm_policy_definition.deploy_diagnostics_rediscache,
    azurerm_policy_definition.deploy_diagnostics_relay,
    azurerm_policy_definition.deploy_diagnostics_searchservices,
    azurerm_policy_definition.deploy_diagnostics_servicebus,
    azurerm_policy_definition.deploy_diagnostics_signalr,
    azurerm_policy_definition.deploy_diagnostics_sqldbs,
    azurerm_policy_definition.deploy_diagnostics_sqlelasticpools,
    azurerm_policy_definition.deploy_diagnostics_sqlmi,
    azurerm_policy_definition.deploy_diagnostics_streamanalytics,
    azurerm_policy_definition.deploy_diagnostics_timeseriesinsights,
    azurerm_policy_definition.deploy_diagnostics_trafficmanager,
    azurerm_policy_definition.deploy_diagnostics_virtualnetwork,
    azurerm_policy_definition.deploy_diagnostics_vm,
    azurerm_policy_definition.deploy_diagnostics_vmss,
    azurerm_policy_definition.deploy_diagnostics_vnetgw,
    azurerm_policy_definition.deploy_diagnostics_webserverfarm,
    azurerm_policy_definition.deploy_diagnostics_website,
  ]

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACI"
    reference_id         = "DeployDiagnosticsACI"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('ACILogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MariaDB"
    reference_id         = "DeployDiagnosticsMariaDB"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('MariaDBLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace"
    reference_id         = "DeployDiagnosticsMlWorkspace"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('MlWorkspaceLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL"
    reference_id         = "DeployDiagnosticsMySQL"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('MySQLLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups"
    reference_id         = "DeployDiagnosticsNetworkSecurityGroups"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('NetworkSecurityGroupsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NIC"
    reference_id         = "DeployDiagnosticsNIC"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('NetworkNICLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL"
    reference_id         = "DeployDiagnosticsPostgreSQL"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('PostgreSQLLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded"
    reference_id         = "DeployDiagnosticsPowerBIEmbedded"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('PowerBIEmbeddedLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PublicIP"
    reference_id         = "DeployDiagnosticsPublicIP"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('NetworkPublicIPNicLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RecoveryVault"
    reference_id         = "DeployDiagnosticsRecoveryVault"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('RecoveryVaultLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache"
    reference_id         = "DeployDiagnosticsRedisCache"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('RedisCacheLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay"
    reference_id         = "DeployDiagnosticsRelay"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('RelayLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsWF"
    reference_id         = "DeployDiagnosticsLogicAppsWF"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('LogicAppsWFLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SearchServices"
    reference_id         = "DeployDiagnosticsSearchServices"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('SearchServicesLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR"
    reference_id         = "DeployDiagnosticsSignalR"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('SignalRLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLDBs"
    reference_id         = "DeployDiagnosticsSQLDBs"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('SQLDBsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools"
    reference_id         = "DeployDiagnosticsSQLElasticPools"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('SQLElasticPoolsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI"
    reference_id         = "DeployDiagnosticsSQLMI"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('SQLMLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-StreamAnalytics"
    reference_id         = "DeployDiagnosticsStreamAnalytics"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('StreamAnalyticsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights"
    reference_id         = "DeployDiagnosticsTimeSeriesInsights"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('TimeSeriesInsightsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager"
    reference_id         = "DeployDiagnosticsTrafficManager"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('TrafficManagerLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork"
    reference_id         = "DeployDiagnosticsVirtualNetwork"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('VirtualNetworkLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM"
    reference_id         = "DeployDiagnosticsVM"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('VirtualMachinesLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS"
    reference_id         = "DeployDiagnosticsVMSS"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('VMSSLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW"
    reference_id         = "DeployDiagnosticsVNetGW"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('VNetGWLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ServiceBus"
    reference_id         = "DeployDiagnosticsServiceBus"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('ServiceBusLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm"
    reference_id         = "DeployDiagnosticsWebServerFarm"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('AppServiceLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE"
    reference_id         = "DeployDiagnosticsLogicAppsISE"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('LogicAppsISELogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-KeyVault"
    reference_id         = "DeployDiagnosticsKeyVault"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('KeyVaultLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR"
    reference_id         = "DeployDiagnosticsACR"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('ACRLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AKS"
    reference_id         = "DeployDiagnosticsAKS"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('AKSLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService"
    reference_id         = "DeployDiagnosticsAnalysisService"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('AnalysisServiceLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt"
    reference_id         = "DeployDiagnosticsAPIMgmt"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('APIMgmtLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway"
    reference_id         = "DeployDiagnosticsApplicationGateway"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('ApplicationGatewayLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA"
    reference_id         = "DeployDiagnosticsAA"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('AutomationLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Batch"
    reference_id         = "DeployDiagnosticsBatch"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('BatchLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints"
    reference_id         = "DeployDiagnosticsCDNEndpoints"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('CDNEndpointsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices"
    reference_id         = "DeployDiagnosticsCognitiveServices"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('CognitiveServicesLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB"
    reference_id         = "DeployDiagnosticsCosmosDB"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('CosmosLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Databricks"
    reference_id         = "DeployDiagnosticsDatabricks"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('DatabricksLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer"
    reference_id         = "DeployDiagnosticsLoadBalancer"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('LoadBalancerLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory"
    reference_id         = "DeployDiagnosticsDataFactory"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('DataFactoryLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics"
    reference_id         = "DeployDiagnosticsDLAnalytics"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('DataLakeAnalyticsLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub"
    reference_id         = "DeployDiagnosticsEventGridSub"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('EventGridSubLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic"
    reference_id         = "DeployDiagnosticsEventGridTopic"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('EventGridTopicLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventHub"
    reference_id         = "DeployDiagnosticsEventHub"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('EventHubLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSystemTopic"
    reference_id         = "DeployDiagnosticsEventGridSystemTopic"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('EventSystemTopicLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute"
    reference_id         = "DeployDiagnosticsExpressRoute"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('ExpressRouteLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall"
    reference_id         = "DeployDiagnosticsFirewall"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('FirewallLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-FrontDoor"
    reference_id         = "DeployDiagnosticsFrontDoor"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('FrontDoorLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Function"
    reference_id         = "DeployDiagnosticsFunction"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('FunctionAppLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight"
    reference_id         = "DeployDiagnosticsHDInsight"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('HDInsightLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub"
    reference_id         = "DeployDiagnosticsiotHub"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('IotHubLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataLakeStore"
    reference_id         = "DeployDiagnosticsDataLakeStore"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('DataLakeStoreLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website"
    reference_id         = "DeployDiagnosticsWebsite"
    parameter_values     = <<VALUES
{
  "logAnalytics": {
    "value": "[parameters('logAnalytics')]"
  },
  "effect": {
    "value": "[parameters('AppServiceWebappLogAnalyticsEffect')]"
  },
  "profileName": {
    "value": "[parameters('profileName')]"
  }
}
VALUES
  }

  parameters = <<PARAMETERS
{
  "ACILogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Container Instances to stream to a Log Analytics workspace when any ACR which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics enabled.",
      "displayName": "Deploy Diagnostic Settings for Container Instances to Log Analytics workspace"
    },
    "type": "String"
  },
  "ACRLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Container Registry to stream to a Log Analytics workspace when any ACR which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics enabled.",
      "displayName": "Deploy Diagnostic Settings for Container Registry to Log Analytics workspace"
    },
    "type": "String"
  },
  "AKSLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Kubernetes Service to stream to a Log Analytics workspace when any Kubernetes Service which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled.",
      "displayName": "Deploy Diagnostic Settings for Kubernetes Service to Log Analytics workspace"
    },
    "type": "String"
  },
  "AnalysisServiceLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Analysis Services to stream to a Log Analytics workspace when any Analysis Services which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Analysis Services to Log Analytics workspace"
    },
    "type": "String"
  },
  "APIMgmtLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for API Management to stream to a Log Analytics workspace when any API Management which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for API Management to Log Analytics workspace"
    },
    "type": "String"
  },
  "ApplicationGatewayLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Application Gateway to stream to a Log Analytics workspace when any Application Gateway which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Application Gateway to Log Analytics workspace"
    },
    "type": "String"
  },
  "AppServiceLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for App Service Plan to stream to a Log Analytics workspace when any App Service Plan which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for App Service Plan to Log Analytics workspace"
    },
    "type": "String"
  },
  "AppServiceWebappLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Web App to stream to a Log Analytics workspace when any Web App which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for App Service to Log Analytics workspace"
    },
    "type": "String"
  },
  "AutomationLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Automation to stream to a Log Analytics workspace when any Automation which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Automation to Log Analytics workspace"
    },
    "type": "String"
  },
  "BatchLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Batch to stream to a Log Analytics workspace when any Batch which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Batch to Log Analytics workspace"
    },
    "type": "String"
  },
  "CDNEndpointsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for CDN Endpoint to stream to a Log Analytics workspace when any CDN Endpoint which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for CDN Endpoint to Log Analytics workspace"
    },
    "type": "String"
  },
  "CognitiveServicesLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Cognitive Services to stream to a Log Analytics workspace when any Cognitive Services which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Cognitive Services to Log Analytics workspace"
    },
    "type": "String"
  },
  "CosmosLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Cosmos DB to stream to a Log Analytics workspace when any Cosmos DB which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Cosmos DB to Log Analytics workspace"
    },
    "type": "String"
  },
  "DatabricksLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Databricks to stream to a Log Analytics workspace when any Databricks which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Databricks to Log Analytics workspace"
    },
    "type": "String"
  },
  "DataFactoryLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Data Factory to stream to a Log Analytics workspace when any Data Factory which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Data Factory to Log Analytics workspace"
    },
    "type": "String"
  },
  "DataLakeAnalyticsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Data Lake Analytics to stream to a Log Analytics workspace when any Data Lake Analytics which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Data Lake Analytics to Log Analytics workspace"
    },
    "type": "String"
  },
  "DataLakeStoreLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Azure Data Lake Store to stream to a Log Analytics workspace when anyAzure Data Lake Store which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Azure Data Lake Store to Log Analytics workspace"
    },
    "type": "String"
  },
  "EventGridSubLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Event Grid subscriptions to stream to a Log Analytics workspace when any Event Grid subscriptions which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Event Grid subscriptions to Log Analytics workspace"
    },
    "type": "String"
  },
  "EventGridTopicLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Event Grid Topic to stream to a Log Analytics workspace when any Event Grid Topic which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Event Grid Topic to Log Analytics workspace"
    },
    "type": "String"
  },
  "EventHubLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Event Hubs to stream to a Log Analytics workspace when any Event Hubs which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Event Hubs to Log Analytics workspace"
    },
    "type": "String"
  },
  "EventSystemTopicLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Event Grid System Topic to stream to a Log Analytics workspace when any Event Grid System Topic which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Event Grid System Topic to Log Analytics workspace"
    },
    "type": "String"
  },
  "ExpressRouteLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for ExpressRoute to stream to a Log Analytics workspace when any ExpressRoute which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for ExpressRoute to Log Analytics workspace"
    },
    "type": "String"
  },
  "FirewallLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Firewall to stream to a Log Analytics workspace when any Firewall which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Firewall to Log Analytics workspace"
    },
    "type": "String"
  },
  "FrontDoorLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Front Door to stream to a Log Analytics workspace when any Front Door which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Front Door to Log Analytics workspace"
    },
    "type": "String"
  },
  "FunctionAppLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Azure Function App to stream to a Log Analytics workspace when any function app which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Azure Function App to Log Analytics workspace"
    },
    "type": "String"
  },
  "HDInsightLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for HDInsight to stream to a Log Analytics workspace when any HDInsight which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for HDInsight to Log Analytics workspace"
    },
    "type": "String"
  },
  "IotHubLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for IoT Hub to stream to a Log Analytics workspace when any IoT Hub which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for IoT Hub to Log Analytics workspace"
    },
    "type": "String"
  },
  "KeyVaultLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Key Vault to stream to a Log Analytics workspace when any Key Vault which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Key Vault to Log Analytics workspace"
    },
    "type": "String"
  },
  "LoadBalancerLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Load Balancer to stream to a Log Analytics workspace when any Load Balancer which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Load Balancer to Log Analytics workspace"
    },
    "type": "String"
  },
  "logAnalytics": {
    "metadata": {
      "description": "Select Log Analytics workspace from dropdown list. If this workspace is outside of the scope of the assignment you must manually grant 'Log Analytics Contributor' permissions (or similar) to the policy assignment's principal ID.",
      "displayName": "Log Analytics workspace",
      "strongType": "omsWorkspace"
    },
    "type": "String"
  },
  "LogicAppsISELogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Logic Apps integration service environment to stream to a Log Analytics workspace when any Logic Apps integration service environment which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Logic Apps integration service environment to Log Analytics workspace"
    },
    "type": "String"
  },
  "LogicAppsWFLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Logic Apps Workflow runtimeto stream to a Log Analytics workspace when any Logic Apps Workflow runtime which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Logic Apps Workflow runtime to Log Analytics workspace"
    },
    "type": "String"
  },
  "MariaDBLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for MariaDB to stream to a Log Analytics workspace when any MariaDB which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for MariaDB to Log Analytics workspace"
    },
    "type": "String"
  },
  "MlWorkspaceLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Machine Learning workspace to stream to a Log Analytics workspace when any Machine Learning workspace which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Machine Learning workspace to Log Analytics workspace"
    },
    "type": "String"
  },
  "MySQLLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Database for MySQL to stream to a Log Analytics workspace when any Database for MySQL which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Database for MySQL to Log Analytics workspace"
    },
    "type": "String"
  },
  "NetworkNICLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Network Interfaces to stream to a Log Analytics workspace when any Network Interfaces which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Network Interfaces to Log Analytics workspace"
    },
    "type": "String"
  },
  "NetworkPublicIPNicLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Public IP addresses to stream to a Log Analytics workspace when any Public IP addresses which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Public IP addresses to Log Analytics workspace"
    },
    "type": "String"
  },
  "NetworkSecurityGroupsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Network Security Groups to stream to a Log Analytics workspace when any Network Security Groups which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Network Security Groups to Log Analytics workspace"
    },
    "type": "String"
  },
  "PostgreSQLLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Database for PostgreSQL to stream to a Log Analytics workspace when any Database for PostgreSQL which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Database for PostgreSQL to Log Analytics workspace"
    },
    "type": "String"
  },
  "PowerBIEmbeddedLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Power BI Embedded to stream to a Log Analytics workspace when any Power BI Embedded which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Power BI Embedded to Log Analytics workspace"
    },
    "type": "String"
  },
  "profileName": {
    "defaultValue": "setbypolicy",
    "metadata": {
      "description": "The diagnostic settings profile name",
      "displayName": "Profile name"
    },
    "type": "String"
  },
  "RecoveryVaultLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Recovery Services vaults to stream to a Log Analytics workspace when any Recovery Services vaults which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Recovery Services vaults to Log Analytics workspace"
    },
    "type": "String"
  },
  "RedisCacheLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Redis Cache to stream to a Log Analytics workspace when any Redis Cache which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Redis Cache to Log Analytics workspace"
    },
    "type": "String"
  },
  "RelayLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Relay to stream to a Log Analytics workspace when any Relay which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Relay to Log Analytics workspace"
    },
    "type": "String"
  },
  "SearchServicesLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Search Services to stream to a Log Analytics workspace when any Search Services which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Search Services to Log Analytics workspace"
    },
    "type": "String"
  },
  "ServiceBusLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for ServiceBus to stream to a Log Analytics workspace when any ServiceBus which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Service Bus namespaces to Log Analytics workspace"
    },
    "type": "String"
  },
  "SignalRLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for SignalR to stream to a Log Analytics workspace when any SignalR which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for SignalR to Log Analytics workspace"
    },
    "type": "String"
  },
  "SQLDBsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for SQL Databases to stream to a Log Analytics workspace when any SQL Databases which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for SQL Databases to Log Analytics workspace"
    },
    "type": "String"
  },
  "SQLElasticPoolsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for SQL Elastic Pools to stream to a Log Analytics workspace when any SQL Elastic Pools which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for SQL Elastic Pools to Log Analytics workspace"
    },
    "type": "String"
  },
  "SQLMLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for SQL Managed Instances to stream to a Log Analytics workspace when any SQL Managed Instances which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for SQL Managed Instances to Log Analytics workspace"
    },
    "type": "String"
  },
  "StreamAnalyticsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Stream Analytics to stream to a Log Analytics workspace when any Stream Analytics which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Stream Analytics to Log Analytics workspace"
    },
    "type": "String"
  },
  "TimeSeriesInsightsLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Time Series Insights to stream to a Log Analytics workspace when any Time Series Insights which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Time Series Insights to Log Analytics workspace"
    },
    "type": "String"
  },
  "TrafficManagerLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Traffic Manager to stream to a Log Analytics workspace when any Traffic Manager which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Traffic Manager to Log Analytics workspace"
    },
    "type": "String"
  },
  "VirtualMachinesLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Virtual Machines to stream to a Log Analytics workspace when any Virtual Machines which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Virtual Machines to Log Analytics workspace"
    },
    "type": "String"
  },
  "VirtualNetworkLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Virtual Network to stream to a Log Analytics workspace when any Virtual Network which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Virtual Network to Log Analytics workspace"
    },
    "type": "String"
  },
  "VMSSLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for Virtual Machine Scale Sets to stream to a Log Analytics workspace when any Virtual Machine Scale Sets which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled",
      "displayName": "Deploy Diagnostic Settings for Virtual Machine Scale Sets to Log Analytics workspace"
    },
    "type": "String"
  },
  "VNetGWLogAnalyticsEffect": {
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "defaultValue": "DeployIfNotExists",
    "metadata": {
      "description": "Deploys the diagnostic settings for VPN Gateway to stream to a Log Analytics workspace when any VPN Gateway which is missing this diagnostic settings is created or updated. The policy wil set the diagnostic with all metrics and category enabled.",
      "displayName": "Deploy Diagnostic Settings for VPN Gateway to Log Analytics workspace"
    },
    "type": "String"
  }
}
PARAMETERS
}

output "policysetdefinition_deploy_diag_loganalytics" {
  value = azurerm_policy_set_definition.deploy_diag_loganalytics
}

output "policysetdefinition_deploy_diag_loganalytics_definitions" {
  value = [
    azurerm_policy_definition.deploy_diagnostics_aa,
    azurerm_policy_definition.deploy_diagnostics_aci,
    azurerm_policy_definition.deploy_diagnostics_acr,
    azurerm_policy_definition.deploy_diagnostics_aks,
    azurerm_policy_definition.deploy_diagnostics_analysisservice,
    azurerm_policy_definition.deploy_diagnostics_apimgmt,
    azurerm_policy_definition.deploy_diagnostics_applicationgateway,
    azurerm_policy_definition.deploy_diagnostics_batch,
    azurerm_policy_definition.deploy_diagnostics_cdnendpoints,
    azurerm_policy_definition.deploy_diagnostics_cognitiveservices,
    azurerm_policy_definition.deploy_diagnostics_cosmosdb,
    azurerm_policy_definition.deploy_diagnostics_databricks,
    azurerm_policy_definition.deploy_diagnostics_datafactory,
    azurerm_policy_definition.deploy_diagnostics_datalakestore,
    azurerm_policy_definition.deploy_diagnostics_dlanalytics,
    azurerm_policy_definition.deploy_diagnostics_eventgridsub,
    azurerm_policy_definition.deploy_diagnostics_eventgridsystemtopic,
    azurerm_policy_definition.deploy_diagnostics_eventgridtopic,
    azurerm_policy_definition.deploy_diagnostics_eventhub,
    azurerm_policy_definition.deploy_diagnostics_expressroute,
    azurerm_policy_definition.deploy_diagnostics_firewall,
    azurerm_policy_definition.deploy_diagnostics_frontdoor,
    azurerm_policy_definition.deploy_diagnostics_function,
    azurerm_policy_definition.deploy_diagnostics_hdinsight,
    azurerm_policy_definition.deploy_diagnostics_iothub,
    azurerm_policy_definition.deploy_diagnostics_keyvault,
    azurerm_policy_definition.deploy_diagnostics_loadbalancer,
    azurerm_policy_definition.deploy_diagnostics_logicappsise,
    azurerm_policy_definition.deploy_diagnostics_logicappswf,
    azurerm_policy_definition.deploy_diagnostics_mariadb,
    azurerm_policy_definition.deploy_diagnostics_mlworkspace,
    azurerm_policy_definition.deploy_diagnostics_mysql,
    azurerm_policy_definition.deploy_diagnostics_networksecuritygroups,
    azurerm_policy_definition.deploy_diagnostics_nic,
    azurerm_policy_definition.deploy_diagnostics_postgresql,
    azurerm_policy_definition.deploy_diagnostics_powerbiembedded,
    azurerm_policy_definition.deploy_diagnostics_publicip,
    azurerm_policy_definition.deploy_diagnostics_recoveryvault,
    azurerm_policy_definition.deploy_diagnostics_rediscache,
    azurerm_policy_definition.deploy_diagnostics_relay,
    azurerm_policy_definition.deploy_diagnostics_searchservices,
    azurerm_policy_definition.deploy_diagnostics_servicebus,
    azurerm_policy_definition.deploy_diagnostics_signalr,
    azurerm_policy_definition.deploy_diagnostics_sqldbs,
    azurerm_policy_definition.deploy_diagnostics_sqlelasticpools,
    azurerm_policy_definition.deploy_diagnostics_sqlmi,
    azurerm_policy_definition.deploy_diagnostics_streamanalytics,
    azurerm_policy_definition.deploy_diagnostics_timeseriesinsights,
    azurerm_policy_definition.deploy_diagnostics_trafficmanager,
    azurerm_policy_definition.deploy_diagnostics_virtualnetwork,
    azurerm_policy_definition.deploy_diagnostics_vm,
    azurerm_policy_definition.deploy_diagnostics_vmss,
    azurerm_policy_definition.deploy_diagnostics_vnetgw,
    azurerm_policy_definition.deploy_diagnostics_webserverfarm,
    azurerm_policy_definition.deploy_diagnostics_website,
  ]
}


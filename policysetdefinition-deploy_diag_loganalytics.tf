# This file was auto generated
resource "azurerm_policy_set_definition" "deploy_diag_loganalytics" {
  name                  = "Deploy-Diag-LogAnalytics"
  policy_type           = "Custom"
  display_name          = "Deploy-Diag-LogAnalytics"
  description           = "This initiative configures application Azure resources to forward diagnostic logs and metrics to an Azure Log Analytics workspace."
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
    azurerm_policy_definition.deploy_diagnostics_datafactory,
    azurerm_policy_definition.deploy_diagnostics_datalakestore,
    azurerm_policy_definition.deploy_diagnostics_dlanalytics,
    azurerm_policy_definition.deploy_diagnostics_eventgridsub,
    azurerm_policy_definition.deploy_diagnostics_eventgridtopic,
    azurerm_policy_definition.deploy_diagnostics_eventhub,
    azurerm_policy_definition.deploy_diagnostics_expressroute,
    azurerm_policy_definition.deploy_diagnostics_firewall,
    azurerm_policy_definition.deploy_diagnostics_hdinsight,
    azurerm_policy_definition.deploy_diagnostics_iothub,
    azurerm_policy_definition.deploy_diagnostics_keyvault,
    azurerm_policy_definition.deploy_diagnostics_loadbalancer,
    azurerm_policy_definition.deploy_diagnostics_logicappsise,
    azurerm_policy_definition.deploy_diagnostics_logicappswf,
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
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NIC"
    reference_id         = "DeployDiagnosticsNIC"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PublicIP"
    reference_id         = "DeployDiagnosticsPublicIP"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer"
    reference_id         = "DeployDiagnosticsLoadBalancer"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups"
    reference_id         = "DeployDiagnosticsNetworkSecurityGroups"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-KeyVault"
    reference_id         = "DeployDiagnosticsKeyVault"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices"
    reference_id         = "DeployDiagnosticsCognitiveServices"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics"
    reference_id         = "DeployDiagnosticsDLAnalytics"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataLakeStore"
    reference_id         = "DeployDiagnosticsDataLakeStore"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventHub"
    reference_id         = "DeployDiagnosticsEventHub"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub"
    reference_id         = "DeployDiagnosticsiotHub"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights"
    reference_id         = "DeployDiagnosticsTimeSeriesInsights"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsWF"
    reference_id         = "DeployDiagnosticsLogicAppsWF"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RecoveryVault"
    reference_id         = "DeployDiagnosticsRecoveryVault"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SearchServices"
    reference_id         = "DeployDiagnosticsSearchServices"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ServiceBus"
    reference_id         = "DeployDiagnosticsServiceBus"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLDBs"
    reference_id         = "DeployDiagnosticsSQLDBs"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools"
    reference_id         = "DeployDiagnosticsSQLElasticPools"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt"
    reference_id         = "DeployDiagnosticsAPIMgmt"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway"
    reference_id         = "DeployDiagnosticsApplicationGateway"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Batch"
    reference_id         = "DeployDiagnosticsBatch"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL"
    reference_id         = "DeployDiagnosticsMySQL"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL"
    reference_id         = "DeployDiagnosticsPostgreSQL"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA"
    reference_id         = "DeployDiagnosticsAA"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints"
    reference_id         = "DeployDiagnosticsCDNEndpoints"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB"
    reference_id         = "DeployDiagnosticsCosmosDB"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory"
    reference_id         = "DeployDiagnosticsDataFactory"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded"
    reference_id         = "DeployDiagnosticsPowerBIEmbedded"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-StreamAnalytics"
    reference_id         = "DeployDiagnosticsStreamAnalytics"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute"
    reference_id         = "DeployDiagnosticsExpressRoute"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACI"
    reference_id         = "DeployDiagnosticsACI"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR"
    reference_id         = "DeployDiagnosticsACR"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork"
    reference_id         = "DeployDiagnosticsVirtualNetwork"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM"
    reference_id         = "DeployDiagnosticsVM"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS"
    reference_id         = "DeployDiagnosticsVMSS"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW"
    reference_id         = "DeployDiagnosticsVNetGW"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AKS"
    reference_id         = "DeployDiagnosticsAKS"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE"
    reference_id         = "DeployDiagnosticsLogicAppsISE"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website"
    reference_id         = "DeployDiagnosticsWebsite"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic"
    reference_id         = "DeployDiagnosticsEventGridTopic"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub"
    reference_id         = "DeployDiagnosticsEventGridSub"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight"
    reference_id         = "DeployDiagnosticsHDInsight"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache"
    reference_id         = "DeployDiagnosticsRedisCache"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay"
    reference_id         = "DeployDiagnosticsRelay"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR"
    reference_id         = "DeployDiagnosticsSignalR"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager"
    reference_id         = "DeployDiagnosticsTrafficManager"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm"
    reference_id         = "DeployDiagnosticsWebServerFarm"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI"
    reference_id         = "DeployDiagnosticsSQLMI"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall"
    reference_id         = "DeployDiagnosticsFirewall"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService"
    reference_id         = "DeployDiagnosticsAnalysisService"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementgroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace"
    reference_id         = "DeployDiagnosticsMlWorkspace"
    parameters = {
      logAnalytics = "[parameters('logAnalytics')]"
    }
  }
  parameters = <<PARAMETERS
{
  "logAnalytics": {
    "metadata": {
      "description": "Select the Log Analytics workspace from dropdown list",
      "displayName": "Log Analytics workspace",
      "strongType": "omsWorkspace"
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
    azurerm_policy_definition.deploy_diagnostics_datafactory,
    azurerm_policy_definition.deploy_diagnostics_datalakestore,
    azurerm_policy_definition.deploy_diagnostics_dlanalytics,
    azurerm_policy_definition.deploy_diagnostics_eventgridsub,
    azurerm_policy_definition.deploy_diagnostics_eventgridtopic,
    azurerm_policy_definition.deploy_diagnostics_eventhub,
    azurerm_policy_definition.deploy_diagnostics_expressroute,
    azurerm_policy_definition.deploy_diagnostics_firewall,
    azurerm_policy_definition.deploy_diagnostics_hdinsight,
    azurerm_policy_definition.deploy_diagnostics_iothub,
    azurerm_policy_definition.deploy_diagnostics_keyvault,
    azurerm_policy_definition.deploy_diagnostics_loadbalancer,
    azurerm_policy_definition.deploy_diagnostics_logicappsise,
    azurerm_policy_definition.deploy_diagnostics_logicappswf,
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


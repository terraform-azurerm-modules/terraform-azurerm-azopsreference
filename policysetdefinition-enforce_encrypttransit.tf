# This file was auto generated
resource "azurerm_policy_set_definition" "enforce_encrypttransit" {
  name                  = "Enforce-EncryptTransit"
  policy_type           = "Custom"
  display_name          = "Deny or Deploy and append TLS requirements and SSL enforcement on resources without Encryption in transit"
  description           = "Choose either Deploy if not exist and append in combination with audit or Select Deny in the Policy effect. Deny polices shift left. Deploy if not exist and append enforce but can be changed, and because missing exsistense condition require then the combination of Audit. "
  management_group_name = var.management_group_name
  depends_on = [
    azurerm_policy_definition.append_appservice_httpsonly,
    azurerm_policy_definition.append_appservice_latesttls,
    azurerm_policy_definition.append_redis_disablenonsslport,
    azurerm_policy_definition.append_redis_sslenforcement,
    azurerm_policy_definition.deny_appserviceapiapp_http,
    azurerm_policy_definition.deny_appservicefunctionapp_http,
    azurerm_policy_definition.deny_appservicewebapp_http,
    azurerm_policy_definition.deny_mysql_http,
    azurerm_policy_definition.deny_postgresql_http,
    azurerm_policy_definition.deny_redis_http,
    azurerm_policy_definition.deny_sql_mintls,
    azurerm_policy_definition.deny_sqlmi_mintls,
    azurerm_policy_definition.deny_storage_mintls,
    azurerm_policy_definition.deploy_mysql_sslenforcement,
    azurerm_policy_definition.deploy_postgresql_sslenforcement,
    azurerm_policy_definition.deploy_sql_mintls,
    azurerm_policy_definition.deploy_sqlmi_mintls,
    azurerm_policy_definition.deploy_storage_sslenforcement,
  ]

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-httpsonly"
    reference_id         = "AppServiceHttpEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('AppServiceHttpEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-latestTLS"
    reference_id         = "AppServiceminTlsVersion"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('AppServiceTlsVersionEffect')]"
  },
  "minTlsVersion": {
    "value": "[parameters('AppServiceminTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e"
    reference_id         = "APIAppServiceLatestTlsEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('APIAppServiceLatestTlsEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193"
    reference_id         = "FunctionLatestTlsEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('FunctionLatestTlsEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b"
    reference_id         = "WebAppServiceLatestTlsEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('WebAppServiceLatestTlsEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceApiApp-http"
    reference_id         = "APIAppServiceHttpsEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('APIAppServiceHttpsEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceFunctionApp-http"
    reference_id         = "FunctionServiceHttpsEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('FunctionServiceHttpsEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceWebApp-http"
    reference_id         = "WebAppServiceHttpsEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('WebAppServiceHttpsEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1a5b4dca-0b6f-4cf5-907c-56316bc1bf3d"
    reference_id         = "AKSIngressHttpsOnlyEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('AKSIngressHttpsOnlyEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MySQL-sslEnforcement"
    reference_id         = "MySQLEnableSSLDeployEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('MySQLEnableSSLDeployEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('MySQLminimalTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-MySql-http"
    reference_id         = "MySQLEnableSSLEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('MySQLEnableSSLEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('MySQLminimalTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-PostgreSQL-sslEnforcement"
    reference_id         = "PostgreSQLEnableSSLDeployEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('PostgreSQLEnableSSLDeployEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('PostgreSQLminimalTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-PostgreSql-http"
    reference_id         = "PostgreSQLEnableSSLEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('PostgreSQLEnableSSLEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('PostgreSQLminimalTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-sslEnforcement"
    reference_id         = "RedisTLSDeployEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('RedisTLSDeployEffect')]"
  },
  "minimumTlsVersion": {
    "value": "[parameters('RedisMinTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-disableNonSslPort"
    reference_id         = "RedisdisableNonSslPort"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('RedisTLSDeployEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-Redis-http"
    reference_id         = "RedisDenyhttps"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('RedisTLSEffect')]"
  },
  "minimumTlsVersion": {
    "value": "[parameters('RedisMinTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SqlMi-minTLS"
    reference_id         = "SQLManagedInstanceTLSDeployEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SQLManagedInstanceTLSDeployEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('SQLManagedInstanceMinTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-SqlMi-minTLS"
    reference_id         = "SQLManagedInstanceTLSEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SQLManagedInstanceTLSEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('SQLManagedInstanceMinTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SQL-minTLS"
    reference_id         = "SQLServerTLSDeployEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SQLServerTLSDeployEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('SQLServerminTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-Sql-minTLS"
    reference_id         = "SQLServerTLSEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SQLServerTLSEffect')]"
  },
  "minimalTlsVersion": {
    "value": "[parameters('SQLServerminTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-minTLS"
    reference_id         = "StorageHttpsEnabledEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('StorageHttpsEnabledEffect')]"
  },
  "minimumTlsVersion": {
    "value": "[parameters('StorageMinimumTlsVersion')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_name}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Storage-sslEnforcement"
    reference_id         = "StorageDeployHttpsEnabledEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('StorageDeployHttpsEnabledEffect')]"
  },
  "minimumTlsVersion": {
    "value": "[parameters('StorageMinimumTlsVersion')]"
  }
}
VALUES
  }

  parameters = <<PARAMETERS
{
  "AppServiceHttpEffect": {
    "type": "String",
    "defaultValue": "Append",
    "allowedValues": [
      "Append",
      "Disabled"
    ],
    "metadata": {
      "displayName": "App Service. Appends the AppService sites config WebApp, APIApp, Function App with TLS version selected below",
      "description": "Append the AppService sites object to ensure that min Tls version is set to required TLS version. Please note Append does not enforce compliance use then deny."
    }
  },
  "AppServiceTlsVersionEffect": {
    "type": "String",
    "defaultValue": "Append",
    "allowedValues": [
      "Append",
      "Disabled"
    ],
    "metadata": {
      "displayName": "App Service. Appends the AppService WebApp, APIApp, Function App to enable https only",
      "description": "App Service. Appends the AppService sites object to ensure that HTTPS only is enabled for server/service authentication and protects data in transit from network layer eavesdropping attacks. Please note Append does not enforce compliance use then deny."
    }
  },
  "AppServiceminTlsVersion": {
    "type": "String",
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.0",
      "1.1"
    ],
    "metadata": {
      "displayName": "App Service. Select version minimum TLS Web App config",
      "description": "App Service. Select version minimum TLS version for a Web App config to enforce"
    }
  },
  "APIAppServiceLatestTlsEffect": {
    "metadata": {
      "displayName": "App Service API App. Latest TLS version should be used in your API App",
      "description": "App Service API App. Only Audit, deny not possible as it is a related resource. Upgrade to the latest TLS version."
    },
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ]
  },
  "APIAppServiceHttpsEffect": {
    "metadata": {
      "displayName": "App Service API App. API App should only be accessible over HTTPS. Choose Deny or Audit in combination with Append policy.",
      "description": "Choose Deny or Audit in combination with Append policy. Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "FunctionLatestTlsEffect": {
    "metadata": {
      "displayName": "App Service Function App. Latest TLS version should be used in your Function App",
      "description": "Only Audit, deny not possible as it is a related resource. Upgrade to the latest TLS version."
    },
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ]
  },
  "FunctionServiceHttpsEffect": {
    "metadata": {
      "displayName": "App Service Function App. Function App should only be accessible over HTTPS. Choose Deny or Audit in combination with Append policy.",
      "description": "App Service Function App. Choose Deny or Audit in combination with Append policy. Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "WebAppServiceLatestTlsEffect": {
    "metadata": {
      "displayName": "App Service Web App. Latest TLS version should be used in your Web App",
      "description": "Only Audit, deny not possible as it is a related resource. Upgrade to the latest TLS version."
    },
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ]
  },
  "WebAppServiceHttpsEffect": {
    "metadata": {
      "displayName": "App Service Web App. Web Application should only be accessible over HTTPS. Choose Deny or Audit in combination with Append policy.",
      "description": "Choose Deny or Audit in combination with Append policy. Use of HTTPS ensures server/service authentication and protects data in transit from network layer eavesdropping attacks."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "AKSIngressHttpsOnlyEffect": {
    "metadata": {
      "displayName": "AKS Service. Enforce HTTPS ingress in Kubernetes cluster",
      "description": "This policy enforces HTTPS ingress in a Kubernetes cluster. This policy is generally available for Kubernetes Service (AKS), and preview for AKS Engine and Azure Arc enabled Kubernetes. For instructions on using this policy, visit https://aka.ms/kubepolicydoc."
    },
    "type": "String",
    "defaultValue": "deny",
    "allowedValues": [
      "audit",
      "deny",
      "disabled"
    ]
  },
  "MySQLEnableSSLDeployEffect": {
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "MySQL database servers. Deploy if not exist set minimum TLS version Azure Database for MySQL server",
      "description": "Deploy a specific min TLS version requirement and enforce SSL on Azure Database for MySQL server. Enforce the Server to client applications using minimum version of Tls to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    }
  },
  "MySQLEnableSSLEffect": {
    "metadata": {
      "displayName": "MySQL database servers. Enforce SSL connection should be enabled for MySQL database servers",
      "description": "Azure Database for MySQL supports connecting your Azure Database for MySQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "MySQLminimalTlsVersion": {
    "type": "String",
    "defaultValue": "TLS1_2",
    "allowedValues": [
      "TLS1_2",
      "TLS1_0",
      "TLS1_1",
      "TLSEnforcementDisabled"
    ],
    "metadata": {
      "displayName": "MySQL database servers. Select version minimum TLS for MySQL server",
      "description": "Select version minimum TLS version Azure Database for MySQL server to enforce"
    }
  },
  "PostgreSQLEnableSSLDeployEffect": {
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "PostgreSQL database servers. Deploy if not exist set minimum TLS version Azure Database for PostgreSQL server",
      "description": "Deploy a specific min TLS version requirement and enforce SSL on Azure Database for PostgreSQL server. Enforce the Server to client applications using minimum version of Tls to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    }
  },
  "PostgreSQLEnableSSLEffect": {
    "metadata": {
      "displayName": "PostgreSQL database servers. Enforce SSL connection should be enabled for PostgreSQL database servers",
      "description": "Azure Database for PostgreSQL supports connecting your Azure Database for PostgreSQL server to client applications using Secure Sockets Layer (SSL). Enforcing SSL connections between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "PostgreSQLminimalTlsVersion": {
    "type": "String",
    "defaultValue": "TLS1_2",
    "allowedValues": [
      "TLS1_2",
      "TLS1_0",
      "TLS1_1",
      "TLSEnforcementDisabled"
    ],
    "metadata": {
      "displayName": "PostgreSQL database servers. Select version minimum TLS for MySQL server",
      "description": "PostgreSQL database servers. Select version minimum TLS version Azure Database for MySQL server to enforce"
    }
  },
  "RedisTLSDeployEffect": {
    "type": "String",
    "defaultValue": "Append",
    "allowedValues": [
      "Append",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure Cache for Redis. Deploy a specific min TLS version requirement and enforce SSL Azure Cache for Redis",
      "description": "Deploy a specific min TLS version requirement and enforce SSL on Azure Cache for Redis. Enables secure server to client by enforce minimal Tls Version to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    }
  },
  "RedisMinTlsVersion": {
    "type": "String",
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.0",
      "1.1"
    ],
    "metadata": {
      "displayName": "Azure Cache for Redis.Select version minimum TLS for Azure Cache for Redis",
      "description": "Select version minimum TLS version for a Azure Cache for Redis to enforce"
    }
  },
  "RedisTLSEffect": {
    "metadata": {
      "displayName": "Azure Cache for Redis. Only secure connections to your Azure Cache for Redis should be enabled",
      "description": "Azure Cache for Redis. Audit enabling of only connections via SSL to Azure Cache for Redis. Use of secure connections ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ]
  },
  "SQLManagedInstanceTLSDeployEffect": {
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure Managed Instance. Deploy a specific min TLS version requirement and enforce SSL on SQL servers",
      "description": "Deploy a specific min TLS version requirement and enforce SSL on SQL servers. Enables secure server to client by enforce minimal Tls Version to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    }
  },
  "SQLManagedInstanceMinTlsVersion": {
    "type": "String",
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.0",
      "1.1"
    ],
    "metadata": {
      "displayName": "Azure Managed Instance.Select version minimum TLS for Azure Managed Instance",
      "description": "Select version minimum TLS version for Azure Managed Instanceto to enforce"
    }
  },
  "SQLManagedInstanceTLSEffect": {
    "metadata": {
      "displayName": "SQL Managed Instance should have the minimal TLS version of 1.2",
      "description": "Setting minimal TLS version to 1.2 improves security by ensuring your SQL Managed Instance can only be accessed from clients using TLS 1.2. Using versions of TLS less than 1.2 is not recommended since they have well documented security vulnerabilities."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "SQLServerTLSDeployEffect": {
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure SQL Database. Deploy a specific min TLS version requirement and enforce SSL on SQL servers",
      "description": "Deploy a specific min TLS version requirement and enforce SSL on SQL servers. Enables secure server to client by enforce minimal Tls Version to secure the connection between your database server and your client applications helps protect against 'man in the middle' attacks by encrypting the data stream between the server and your application. This configuration enforces that SSL is always enabled for accessing your database server."
    }
  },
  "SQLServerminTlsVersion": {
    "type": "String",
    "defaultValue": "1.2",
    "allowedValues": [
      "1.2",
      "1.0",
      "1.1"
    ],
    "metadata": {
      "displayName": "Azure SQL Database.Select version minimum TLS for Azure SQL Database",
      "description": "Select version minimum TLS version for Azure SQL Database to enforce"
    }
  },
  "SQLServerTLSEffect": {
    "metadata": {
      "displayName": "Azure SQL Database should have the minimal TLS version of 1.2",
      "description": "Setting minimal TLS version to 1.2 improves security by ensuring your Azure SQL Database can only be accessed from clients using TLS 1.2. Using versions of TLS less than 1.2 is not recommended since they have well documented security vulnerabilities."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ]
  },
  "StorageDeployHttpsEnabledEffect": {
    "metadata": {
      "displayName": "Azure Storage Account. Deploy Secure transfer to storage accounts should be enabled",
      "description": "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
    },
    "type": "String",
    "defaultValue": "DeployIfNotExists",
    "allowedValues": [
      "DeployIfNotExists",
      "Disabled"
    ]
  },
  "StorageminimumTlsVersion": {
    "type": "String",
    "defaultValue": "TLS1_2",
    "allowedValues": [
      "TLS1_2",
      "TLS1_1",
      "TLS1_0"
    ],
    "metadata": {
      "displayName": "Storage Account select minimum TLS version",
      "description": "Select version minimum TLS version on Azure Storage Account to enforce"
    }
  },
  "StorageHttpsEnabledEffect": {
    "metadata": {
      "displayName": "Azure Storage Account. Secure transfer to storage accounts should be enabled",
      "description": "Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking"
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ]
  }
}
PARAMETERS
}

output "policysetdefinition_enforce_encrypttransit" {
  value = azurerm_policy_set_definition.enforce_encrypttransit
}

output "policysetdefinition_enforce_encrypttransit_definitions" {
  value = [
    azurerm_policy_definition.append_appservice_httpsonly,
    azurerm_policy_definition.append_appservice_latesttls,
    azurerm_policy_definition.append_redis_disablenonsslport,
    azurerm_policy_definition.append_redis_sslenforcement,
    azurerm_policy_definition.deny_appserviceapiapp_http,
    azurerm_policy_definition.deny_appservicefunctionapp_http,
    azurerm_policy_definition.deny_appservicewebapp_http,
    azurerm_policy_definition.deny_mysql_http,
    azurerm_policy_definition.deny_postgresql_http,
    azurerm_policy_definition.deny_redis_http,
    azurerm_policy_definition.deny_sql_mintls,
    azurerm_policy_definition.deny_sqlmi_mintls,
    azurerm_policy_definition.deny_storage_mintls,
    azurerm_policy_definition.deploy_mysql_sslenforcement,
    azurerm_policy_definition.deploy_postgresql_sslenforcement,
    azurerm_policy_definition.deploy_sql_mintls,
    azurerm_policy_definition.deploy_sqlmi_mintls,
    azurerm_policy_definition.deploy_storage_sslenforcement,
  ]
}


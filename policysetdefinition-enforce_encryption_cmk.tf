# This file was auto generated
resource "azurerm_policy_set_definition" "enforce_encryption_cmk" {
  name                  = "Enforce-Encryption-CMK"
  policy_type           = "Custom"
  display_name          = "Deny or Audit resources without Encryption with a customer-managed key (CMK)"
  description           = "Deny or Audit resources without Encryption with a customer-managed key (CMK)"
  management_group_name = var.management_group_name
  depends_on = [

  ]

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/5b9159ae-1701-4a6f-9a7a-aa9c8ddd0580"
    reference_id         = "ACRCmkDeny"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('ACRCmkEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/7d7be79c-23ba-4033-84dd-45e2a5ccdd67"
    reference_id         = "AksCmkDeny"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('AksCmkEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/ba769a63-b8cc-4b2d-abf6-ac33c7204be8"
    reference_id         = "WorkspaceCMK"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('WorkspaceCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/67121cc7-ff39-4ab8-b7e3-95b84dab487d"
    reference_id         = "CognitiveServicesCMK"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('CognitiveServicesCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/1f905d99-2ab7-462c-a6b0-f709acca6c8f"
    reference_id         = "CosmosCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('CosmosCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/86efb160-8de7-451d-bc08-5d475b0aadae"
    reference_id         = "DataBoxCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('DataBoxCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/87ba29ef-1ab3-4d82-b763-87fcd4f531f7"
    reference_id         = "StreamAnalyticsCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('StreamAnalyticsCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/f7d52b2d-e161-4dfa-a82b-55e564167385"
    reference_id         = "SynapseWorkspaceCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SynapseWorkspaceCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/6fac406b-40ca-413b-bf8e-0bf964659c25"
    reference_id         = "StorageCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('StorageCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/83cef61d-dbd1-4b20-a4fc-5fbc7da10833"
    reference_id         = "MySQLCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('MySQLCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/18adea5e-f416-4d0f-8aa8-d24321e3e274"
    reference_id         = "PostgreSQLCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('PostgreSQLCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0d134df8-db83-46fb-ad72-fe0c9428c8dd"
    reference_id         = "SqlServerTDECMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('SqlServerTDECMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/051cba44-2429-45b9-9649-46cec11c7119"
    reference_id         = "HealthcareAPIsCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('HealthcareAPIsCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/99e9ccd8-3db9-4592-b0d1-14b1715a4d8a"
    reference_id         = "AzureBatchCMKEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('AzureBatchCMKEffect')]"
  }
}
VALUES
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d"
    reference_id         = "EncryptedVMDisksEffect"
    parameter_values     = <<VALUES
{
  "effect": {
    "value": "[parameters('EncryptedVMDisksEffect')]"
  }
}
VALUES
  }

  parameters = <<PARAMETERS
{
  "ACRCmkEffect": {
    "metadata": {
      "displayName": "Container registries should be encrypted with a customer-managed key (CMK)",
      "description": "Use customer-managed keys to manage the encryption at rest of the contents of your registries. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more about CMK encryption at https://aka.ms/acr/CMK."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ]
  },
  "AksCmkEffect": {
    "metadata": {
      "displayName": "Azure Kubernetes Service clusters both operating systems and data disks should be encrypted by customer-managed keys",
      "description": "Encrypting OS and data disks using customer-managed keys provides more control and greater flexibility in key management. This is a common requirement in many regulatory and industry compliance standards."
    },
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ]
  },
  "WorkspaceCMKEffect": {
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure Machine Learning workspaces should be encrypted with a customer-managed key (CMK)",
      "description": "Manage encryption at rest of your Azure Machine Learning workspace data with customer-managed keys (CMK). By default, customer data is encrypted with service-managed keys, but CMKs are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more about CMK encryption at https://aka.ms/azureml-workspaces-cmk."
    }
  },
  "CognitiveServicesCMKEffect": {
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Cognitive Services accounts should enable data encryption with a customer-managed key (CMK)",
      "description": "Customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data stored in Cognitive Services to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more about CMK encryption at https://aka.ms/cosmosdb-cmk."
    }
  },
  "CosmosCMKEffect": {
    "type": "String",
    "defaultValue": "audit",
    "allowedValues": [
      "audit",
      "deny",
      "disabled"
    ],
    "metadata": {
      "displayName": "Azure Cosmos DB accounts should use customer-managed keys to encrypt data at rest",
      "description": "Use customer-managed keys to manage the encryption at rest of your Azure Cosmos DB. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more about CMK encryption at https://aka.ms/cosmosdb-cmk."
    }
  },
  "DataBoxCMKEffect": {
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure Data Box jobs should use a customer-managed key to encrypt the device unlock password",
      "description": "Use a customer-managed key to control the encryption of the device unlock password for Azure Data Box. Customer-managed keys also help manage access to the device unlock password by the Data Box service in order to prepare the device and copy data in an automated manner. The data on the device itself is already encrypted at rest with Advanced Encryption Standard 256-bit encryption, and the device unlock password is encrypted by default with a Microsoft managed key."
    }
  },
  "StreamAnalyticsCMKEffect": {
    "type": "String",
    "defaultValue": "audit",
    "allowedValues": [
      "audit",
      "deny",
      "disabled"
    ],
    "metadata": {
      "displayName": "Azure Stream Analytics jobs should use customer-managed keys to encrypt data",
      "description": "Use customer-managed keys when you want to securely store any metadata and private data assets of your Stream Analytics jobs in your storage account. This gives you total control over how your Stream Analytics data is encrypted."
    }
  },
  "SynapseWorkspaceCMKEffect": {
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure Synapse workspaces should use customer-managed keys to encrypt data at rest",
      "description": "Use customer-managed keys to control the encryption at rest of the data stored in Azure Synapse workspaces. Customer-managed keys deliver double encryption by adding a second layer of encryption on top of the default encryption with service-managed keys."
    }
  },
  "StorageCMKEffect": {
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Storage accounts should use customer-managed key (CMK) for encryption, no deny as this would result in not able to create storage account because the first need of MSI for encryption",
      "description": "Secure your storage account with greater flexibility using customer-managed keys (CMKs). When you specify a CMK, that key is used to protect and control access to the key that encrypts your data. Using CMKs provides additional capabilities to control rotation of the key encryption key or cryptographically erase data."
    }
  },
  "MySQLCMKEffect": {
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure MySQL servers bring your own key data protection should be enabled",
      "description": "Use customer-managed keys to manage the encryption at rest of your MySQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
    }
  },
  "PostgreSQLCMKEffect": {
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure PostgreSQL servers bring your own key data protection should be enabled",
      "description": "Use customer-managed keys to manage the encryption at rest of your PostgreSQL servers. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management."
    }
  },
  "SqlServerTDECMKEffect": {
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "SQL servers should use customer-managed keys to encrypt data at rest",
      "description": "Implementing Transparent Data Encryption (TDE) with your own key provides increased transparency and control over the TDE Protector, increased security with an HSM-backed external service, and promotion of separation of duties. This recommendation applies to organizations with a related compliance requirement."
    }
  },
  "HealthcareAPIsCMKEffect": {
    "type": "String",
    "defaultValue": "audit",
    "allowedValues": [
      "audit",
      "disabled"
    ],
    "metadata": {
      "displayName": "Azure API for FHIR should use a customer-managed key (CMK) to encrypt data at rest",
      "description": "Use a customer-managed key to control the encryption at rest of the data stored in Azure API for FHIR when this is a regulatory or compliance requirement. Customer-managed keys also deliver double encryption by adding a second layer of encryption on top of the default one done with service-managed keys."
    }
  },
  "AzureBatchCMKEffect": {
    "type": "String",
    "defaultValue": "Audit",
    "allowedValues": [
      "Audit",
      "Deny",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Azure Batch account should use customer-managed keys to encrypt data",
      "description": "Use customer-managed keys (CMKs) to manage the encryption at rest of your Batch account's data. By default, customer data is encrypted with service-managed keys, but CMKs are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more about CMK encryption at https://aka.ms/Batch-CMK."
    }
  },
  "EncryptedVMDisksEffect": {
    "type": "String",
    "defaultValue": "AuditIfNotExists",
    "allowedValues": [
      "AuditIfNotExists",
      "Disabled"
    ],
    "metadata": {
      "displayName": "Disk encryption should be applied on virtual machines",
      "description": "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
    }
  }
}
PARAMETERS
}

output "policysetdefinition_enforce_encryption_cmk" {
  value = azurerm_policy_set_definition.enforce_encryption_cmk
}

output "policysetdefinition_enforce_encryption_cmk_definitions" {
  value = [

  ]
}


# This file was auto generated
resource "azurerm_policy_definition" "deny_machinelearning_computecluster_scale" {
  name         = "Deny-MachineLearning-ComputeCluster-Scale"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Deny-MachineLearning-ComputeCluster-Scale"
  description  = "Enforce scale settings for machine learning compute clusters."
  metadata     = <<METADATA
{
  "version": "1.0.0",
  "category": "Budget"
}
METADATA

  management_group_name = var.management_group_name
  policy_rule           = <<POLICYRULE
{
  "if": {
    "allOf": [
      {
        "field": "type",
        "equals": "Microsoft.MachineLearningServices/workspaces/computes"
      },
      {
        "field": "Microsoft.MachineLearningServices/workspaces/computes/computeType",
        "equals": "AmlCompute"
      },
      {
        "anyOf": [
          {
            "field": "Microsoft.MachineLearningServices/workspaces/computes/scaleSettings.maxNodeCount",
            "greater": "[parameters('maxNodeCount')]"
          },
          {
            "field": "Microsoft.MachineLearningServices/workspaces/computes/scaleSettings.minNodeCount",
            "greater": "[parameters('minNodeCount')]"
          },
          {
            "value": "[int(last(split(replace(replace(replace(replace(replace(replace(replace(field('Microsoft.MachineLearningServices/workspaces/computes/scaleSettings.nodeIdleTimeBeforeScaleDown'), 'P', '/'), 'Y', '/'), 'M', '/'), 'D', '/'), 'T', '/'), 'H', '/'), 'S', ''), '/')))]",
            "greater": "[parameters('maxNodeIdleTimeInSecondsBeforeScaleDown')]"
          }
        ]
      }
    ]
  },
  "then": {
    "effect": "[parameters('effect')]"
  }
}
POLICYRULE

  parameters = <<PARAMETERS
{
  "effect": {
    "type": "String",
    "metadata": {
      "displayName": "Effect",
      "description": "Enable or disable the execution of the policy"
    },
    "allowedValues": [
      "Audit",
      "Disabled",
      "Deny"
    ],
    "defaultValue": "Deny"
  },
  "maxNodeCount": {
    "type": "Integer",
    "metadata": {
      "displayName": "Maximum Node Count",
      "description": "Specifies the maximum node count of AML Clusters"
    },
    "defaultValue": 10
  },
  "minNodeCount": {
    "type": "Integer",
    "metadata": {
      "displayName": "Minimum Node Count",
      "description": "Specifies the minimum node count of AML Clusters"
    },
    "defaultValue": 0
  },
  "maxNodeIdleTimeInSecondsBeforeScaleDown": {
    "type": "Integer",
    "metadata": {
      "displayName": "Maximum Node Idle Time in Seconds Before Scaledown",
      "description": "Specifies the maximum node idle time in seconds before scaledown"
    },
    "defaultValue": 900
  }
}
PARAMETERS

}

output "policydefinition_deny_machinelearning_computecluster_scale" {
  value = azurerm_policy_definition.deny_machinelearning_computecluster_scale
}


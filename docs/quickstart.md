# Quickstart

Use these steps to deploy common Azure building blocks with parameterized Bicep modules.

## At a glance
- Scope: subscription deployment that creates a resource group and modules
- Prefix: <ORG_NAME>-<APP_NAME>-<ENV> (lowercase)
- Region example: eastus2

## Prerequisites
- [ ] Azure CLI 2.55 or later
- [ ] Bicep available in Azure CLI (run: az bicep install)
- [ ] Permissions to deploy at subscription and resource group scope
- [ ] Repo cloned locally

## Setup
```bash
az login
az account set --subscription "<SUBSCRIPTION_ID>"
az bicep version || az bicep install
```

## Configure parameters
Edit a file under parameters/. Example:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "location": { "value": "eastus2" },
    "orgName": { "value": "<ORG_NAME>" },
    "appName": { "value": "<APP_NAME>" },
    "env": { "value": "dev" },
    "resourceGroupName": { "value": "<ORG_NAME>-<APP_NAME>-dev-rg" }
  }
}
```

## Preview changes
```bash
az deployment sub what-if   --location eastus2   --template-file main.bicep   --parameters @parameters/main.parameters.dev.json
```

## Deploy
```bash
az deployment sub create   --location eastus2   --template-file main.bicep   --parameters @parameters/main.parameters.dev.json
```

## Validate
```bash
RG_NAME="<ORG_NAME>-<APP_NAME>-dev-rg"

# Resource group
az group show -n "$RG_NAME" -o table

# Log Analytics
az monitor log-analytics workspace show -g "$RG_NAME" -n "<org>-<app>-dev-law" -o table

# Key Vault
az keyvault show -g "$RG_NAME" -n "<org>-<app>-dev-kv" -o table

# Storage and ACR
az storage account list -g "$RG_NAME" -o table
az acr list -g "$RG_NAME" -o table

# Container Apps environment
az resource show -g "$RG_NAME"   --resource-type "Microsoft.App/managedEnvironments"   -n "<org>-<app>-dev-cae" -o table
```

## Optional modules
- [ ] Uncomment Cognitive Search in main.bicep if needed
- [ ] Uncomment PostgreSQL Flexible in main.bicep and pass secure admin parameters

## Clean up
```bash
az group delete -n "$RG_NAME" --yes --no-wait
```

## Troubleshooting
- Bicep not found: run az bicep install, then az bicep version
- Insufficient privileges: ensure Owner or required roles at sub and RG scope
- Name conflicts: adjust <ORG_NAME>, <APP_NAME>, or <ENV> for uniqueness

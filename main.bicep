targetScope = 'subscription'

@description('Azure region, e.g., eastus2')
param location string

@description('Organization short name, e.g., contoso')
param orgName string

@description('Application/system name, e.g., platform')
param appName string

@description('Environment tag, e.g., dev/test/prod')
param env string

var prefix = toLower('${orgName}-${appName}-${env}')

@description('Resource group name (created if it does not exist)')
param resourceGroupName string

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
  tags: {
    org: orgName
    app: appName
    env: env
  }
}

module la 'modules/loganalytics.bicep' = {
  name: 'loganalytics'
  scope: rg
  params: {
    namePrefix: prefix
    location: location
    retentionDays: 30
  }
}

module kv 'modules/keyvault.bicep' = {
  name: 'keyvault'
  scope: rg
  params: {
    namePrefix: prefix
    location: location
    skuName: 'standard'
    purgeProtectionEnabled: true
    softDeleteRetentionDays: 7
  }
}

module st 'modules/storage.bicep' = {
  name: 'storage'
  scope: rg
  params: {
    namePrefix: prefix
    location: location
    kind: 'StorageV2'
    enableHttpsTrafficOnly: true
  }
}

module acr 'modules/containerregistry.bicep' = {
  name: 'containerregistry'
  scope: rg
  params: {
    namePrefix: prefix
    location: location
    sku: 'Basic'
    adminUserEnabled: false
  }
}

module cae 'modules/containerapps-env.bicep' = {
  name: 'containerapps-env'
  scope: rg
  params: {
    namePrefix: prefix
    location: location
    logAnalyticsWorkspaceId: la.outputs.workspaceId
    logAnalyticsPrimaryKey: la.outputs.primarySharedKey
  }
}

// Optional services — wire only if you need them
// module search 'modules/cognitive-search.bicep' = { ... }
// module pg 'modules/postgres-flex.bicep' = { ... }

param namePrefix string
param location string
param skuName string = 'standard'
param purgeProtectionEnabled bool = true
@minValue(7) @maxValue(90) param softDeleteRetentionDays int = 7

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: '${namePrefix}-kv'
  location: location
  properties: {
    tenantId: subscription().tenantId
    enablePurgeProtection: purgeProtectionEnabled
    enableSoftDelete: true
    softDeleteRetentionInDays: softDeleteRetentionDays
    sku: { family: 'A'; name: toUpper(skuName) }
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: true
    accessPolicies: [] // Use RBAC by default
  }
}

resource kvRbac 'Microsoft.Authorization/roleAssignments@2022-04-01' existing = {
  scope: kv
  name: '00000000-0000-0000-0000-000000000000' // placeholder if you need role assignments
}

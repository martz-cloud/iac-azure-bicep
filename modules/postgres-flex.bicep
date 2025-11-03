param namePrefix string
param location string
param version string = '16' // PostgreSQL major version
param skuName string = 'Standard_B1ms'
param storageSizeGB int = 64

resource pg 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${namePrefix}-pg'
  location: location
  properties: {
    version: version
    storage: { storageSizeGB: storageSizeGB }
    administratorLogin: '<ADMIN_USER>'     // replace at deploy time
    administratorLoginPassword: '<ADMIN_PASSWORD>' // use Key Vault or secure params
    highAvailability: { mode: 'Disabled' }
    backup: { backupRetentionDays: 7 }
  }
  sku: { name: skuName; tier: 'Burstable' }
}

output serverName string = pg.name

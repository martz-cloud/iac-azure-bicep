param namePrefix string
param location string
param kind string = 'StorageV2'
param enableHttpsTrafficOnly bool = true

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: toLower(replace('${namePrefix}st', '-', ''))
  location: location
  kind: kind
  sku: { name: 'Standard_LRS' }
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: enableHttpsTrafficOnly
    allowBlobPublicAccess: false
  }
}

output storageAccountName string = sa.name

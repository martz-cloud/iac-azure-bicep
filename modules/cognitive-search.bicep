param namePrefix string
param location string
@allowed([ 'basic', 'standard', 'standard2', 'standard3' ]) param sku string = 'basic'

resource search 'Microsoft.Search/searchServices@2023-11-01' = {
  name: '${namePrefix}-search'
  location: location
  sku: { name: sku }
  properties: {
    hostingMode: 'default'
    publicNetworkAccess: 'enabled'
  }
}

output searchName string = search.name

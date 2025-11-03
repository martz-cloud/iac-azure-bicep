param namePrefix string
param location string
@allowed([ 'Basic', 'Standard', 'Premium' ]) param sku string = 'Basic'
param adminUserEnabled bool = false

resource acr 'Microsoft.ContainerRegistry/registries@2023-07-01' = {
  name: toLower(replace('${namePrefix}acr', '-', ''))
  location: location
  sku: { name: sku }
  properties: { adminUserEnabled: adminUserEnabled }
}

output loginServer string = acr.properties.loginServer

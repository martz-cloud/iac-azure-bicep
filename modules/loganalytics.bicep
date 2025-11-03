param namePrefix string
param location string
@minValue(7) @maxValue(730) param retentionDays int = 30

resource ws 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${namePrefix}-law'
  location: location
  properties: { retentionInDays: retentionDays }
  sku: { name: 'PerGB2018' }
}

output workspaceId string = ws.id
output primarySharedKey string = listKeys(ws.id, ws.apiVersion).primarySharedKey

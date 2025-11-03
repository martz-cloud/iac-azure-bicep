param namePrefix string
param location string
param logAnalyticsWorkspaceId string
param logAnalyticsPrimaryKey string

resource cae 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: '${namePrefix}-cae'
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: reference(logAnalyticsWorkspaceId, '2022-10-01').customerId
        sharedKey: logAnalyticsPrimaryKey
      }
    }
  }
}

output environmentId string = cae.id

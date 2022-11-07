param location string = resourceGroup().location

resource app_service_plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'example-asp1'
  location: location
  sku: {
    tier: 'Shared'
    name: 'D1'
  }
}

resource app_service 'Microsoft.Web/sites@2022-03-01' = {
  name: 'bt-example-wa1'
  location: location
  properties: {
    serverFarmId: app_service_plan.id
    siteConfig: {
      netFrameworkVersion: 'v6.0'
    }
  }
}

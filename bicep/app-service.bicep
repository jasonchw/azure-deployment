@description('Location for all resources.')
param location string = resourceGroup().location


// parameters - app service plan
@description('App Service plan name')
param appServicePlanName string = 'plan-alpha-01'

@description('App Service plan SKU')
param appServicePlanSku string = 'S1'

// parameters - app service
@description('App Service name')
param appServiceName string = 'app-alpha-01'


// resources
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: appServiceName
  location: location
  kind: 'app'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    clientAffinityEnabled: true
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'TOMCAT|9.0-jre8'
      alwaysOn: true
      ftpsState: 'FtpsOnly'
      appSettings: [
        {
          name: 'JAVA_OPTS'
          value: '-XX:StartFlightRecording=disk=true,name=continuous_recording,dumponexit=true,maxsize=1024m,maxage=1d'
        }
      ]
    }
  }
}

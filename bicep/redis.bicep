@description('Location for all resources.')
param location string = resourceGroup().location


// parameters - redis
@description('Redis name')
param redisName string = 'redis-alpha-01'

@allowed([
  'Basic'
  'Standard'
  'Premium'
])
@description('Type of Redis cache.')
param redisSkuName string = 'Basic'

@allowed([
  'C'
  'P'
])
@description('Size of Redis cache to deploy. Basic and Standard Cache sizes start with C. Premium Cache sizes start with P.')
param redisSkuFamily string = 'C'

@description('Accepted values for Basic/Standard: 0, 1, 2, 3, 4, 5, 6; for Premium: 1, 2, 3, 4, 5')
param redisSkuCapacity int = 0


// resources
resource redis 'Microsoft.Cache/Redis@2019-07-01' = {
  name: redisName
  location: location
  properties: {
    sku: {
      name: redisSkuName
      family: redisSkuFamily
      capacity: redisSkuCapacity
    }
  }
}

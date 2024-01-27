param location string
param skuname string
param name string
param kind string

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: name
  location: location 
  sku: {
    name: skuname
  }
  kind: kind
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

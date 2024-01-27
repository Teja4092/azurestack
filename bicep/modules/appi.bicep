param location string
param name string
param kind string

resource appinsights 'Microsoft.Insights/components@2020-02-02' = {
  name: name
  location: location
  kind: kind
  properties:{
    Application_Type: kind
    ImmediatePurgeDataOn30Days: false
  }
}

targetScope = 'subscription'
param location string = 'centralindia'
param name string



resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: name
  managedBy: 'Ravi Teja'
  location: location
}

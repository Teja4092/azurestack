// Bicep Deployment script for project STARWARS


targetScope = 'subscription'
@allowed([
  'pd'
  'te'
  'de'
])
@description('Required. environment')
param environment string = 'de'

@description('resourceGroup Name')
param rgname string = 'rg-sw-${environment}-cin'

@description('resourceGroup Name')
param staccountname string = 'stswdecin'

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GZRS'
  'Standard_RAGZRS'
])
param storageSKU string = 'Standard_LRS'

param location string = 'centralindia'

param appinsightsname string = 'appi-starwars'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgname
  location: location
  managedBy: 'Ravi Teja'
}

module rg '../../modules/resourcegroup.bicep' ={
  scope: subscription()
  name: '${uniqueString(deployment().name, location)}-rg'
  params: {
  name: rgname
  location: location
  }
}

// Storage account Module
module stg '../../modules/storage.bicep' = {
  scope: resourceGroup
  name: '${uniqueString(deployment().name, location)}-stg' 
  params: {
    name: staccountname
    location: location
    skuname: storageSKU
    kind: 'StorageV2'}
 }

// App Insights Module 
module appinsights '../../modules/appi.bicep' = {
  scope: resourceGroup
  name: '${uniqueString(deployment().name, location)}-appi'
  params: {
  name: appinsightsname
  location: location
  kind: 'web'
 } 
}


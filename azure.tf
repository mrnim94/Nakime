# terraform block moved to main.tf

module "cosmosdb_mongodb_ru" {
  source  = "azure-terraform-module/cosmosdb-mongodb-ru/azure"
  count   = 0
  
  location            = local.azure_location
  resource_group_name = local.azure_resource_group
  mongodb_name        = local.azure_mongodb_name
  geo_locations       = [{
    location          = local.azure_location
    failover_priority = 0
  }]
}

module "services_bus_ampq" {
  source  = "azure-terraform-module/services-bus-ampq/azure"
  count   = 0
  
  location            = local.azure_location
  resource_group_name = local.azure_resource_group
  namespace_name      = local.azure_namespace_name
}

module "vnet" {
  source  = "azure-terraform-module/vnet/azure"
  count   = 0
  
  location            = local.azure_location
  resource_group_name = local.azure_resource_group
  vnet_name           = local.azure_vnet_name
  address_space       = local.azure_address_space
  subnet_prefixes     = local.azure_subnet_prefixes
}

module "aks_k8s" {
  source  = "azure-terraform-module/aks-k8s/azure"
  count   = 0
  
  location            = local.azure_location
  resource_group_name = local.azure_resource_group
  cluster_name        = local.azure_aks_name
}

module "event_hubs_kafka" {
  source  = "azure-terraform-module/event-hubs-kafka/azure"
  count   = 0
  
  location            = local.azure_location
  resource_group_name = local.azure_resource_group
}

module "cosmosdb_mongodb_vcore" {
  source  = "azure-terraform-module/cosmosdb-mongodb-vcore/azure"
  count   = 0
  
  location            = local.azure_location
  resource_group_name = local.azure_resource_group
  cluster_name        = local.azure_mongodb_name
  admin_username      = "dummyuser"
}

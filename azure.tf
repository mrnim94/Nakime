# terraform block moved to main.tf

module "cosmosdb_mongodb_ru" {
  source  = "azure-terraform-module/cosmosdb-mongodb-ru/azure"
  count   = 0
}

module "services_bus_ampq" {
  source  = "azure-terraform-module/services-bus-ampq/azure"
  count   = 0
}

module "vnet" {
  source  = "azure-terraform-module/vnet/azure"
  count   = 0
}

module "aks_k8s" {
  source  = "azure-terraform-module/aks-k8s/azure"
  count   = 0
}

module "event_hubs_kafka" {
  source  = "azure-terraform-module/event-hubs-kafka/azure"
  count   = 0
}

module "cosmosdb_mongodb_vcore" {
  source  = "azure-terraform-module/cosmosdb-mongodb-vcore/azure"
  count   = 0
}

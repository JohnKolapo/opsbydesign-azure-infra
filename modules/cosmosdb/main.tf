# modules/cosmosdb/main.tf

resource "azurerm_cosmosdb_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  enable_automatic_failover         = true
  is_virtual_network_filter_enabled = false

  capabilities {
    name = "EnableServerless"
  }

  tags = var.tags
}

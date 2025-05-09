# modules/functions/main.tf

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  kind                     = "StorageV2"
  is_hns_enabled           = false
  allow_blob_public_access = false
  tags                     = var.tags
}

resource "azurerm_app_service_plan" "this" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "FunctionApp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  tags = var.tags
}

resource "azurerm_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.this.id
  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  version                    = "~4"
  os_type                    = "linux"

  identity {
    type = "SystemAssigned"
  }

  app_settings = merge(
    {
      FUNCTIONS_WORKER_RUNTIME = var.runtime,
      WEBSITE_RUN_FROM_PACKAGE = "1"
    },
    var.app_settings
  )

  tags = var.tags
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-opsbydesign-state"
    storage_account_name = "opsbydesignstate"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}


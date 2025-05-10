provider "azurerm" {
  features = {}
  subscription_id = "3de791aa-2da8-4e3d-b7c7-0c284fb336cf"
}


resource "azurerm_resource_group" "dns" {
  name     = "rg-opsbydesign-dns"
  location = "Canada Central"
}

resource "azurerm_app_service_plan" "this" {
  name                = "opsbydesign-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = var.tags
}

resource "azurerm_dns_zone" "main" {
  name                = "opsbydesign.ca"
  resource_group_name = azurerm_resource_group.dns.name
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = "vnet-dev-opsbydesign"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  tags                = var.tags

  subnets = {
    subnet-app = {
      address_prefixes = ["10.0.1.0/24"]
    },
    subnet-db = {
      address_prefixes = ["10.0.2.0/24"]
    }
  }

  nsgs = {
    nsg-app = {
      security_rules = [
        {
          name                       = "Allow_HTTP"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "80"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      ]
    },
    nsg-db = {
      security_rules = [
        {
          name                       = "Allow_SQL"
          priority                   = 200
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "1433"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
      ]
    }
  }

  nsg_associations = {
    subnet-app = "nsg-app"
    subnet-db  = "nsg-db"
  }
}

module "identity" {
  source              = "../../modules/identity"
  name                = "opsbydesign-ci-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  role_assignments = {
    keyvault-reader = {
      scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.KeyVault/vaults/opsbydesign-kv"
      role  = "Key Vault Reader"
    },
    storage-contributor = {
      scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Storage/storageAccounts/opsbydesignstate"
      role  = "Storage Blob Data Contributor"
    }
  }
}

module "nsg" {
  source              = "C:\users\kkolapo\projects\opsbydesign-azure-infra\modules\nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  nsgs                = var.nsgs
  nsg_associations    = var.nsg_associations
}

module "compute_vm" {
  source                  = "C:\users\kkolapo\projects\opsbydesign-azure-infra\modules\compute"
  name                    = "dev-winvm-01"
  location                = var.location
  resource_group_name     = var.resource_group_name
  vm_size                 = "Standard_B2s"
  admin_username          = var.admin_username
  admin_password          = var.admin_password
  subnet_id               = module.vnet.subnet_ids["public-subnet"]
  user_assigned_identity_id = module.identity.identity_id
  public_ip               = true
  tags                    = var.tags
}

module "app_service" {
  source                  = "C:\users\kkolapo\projects\opsbydesign-azure-infra\modules\app_service"
  name                    = "webapp-opsbydesign"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_tier                = "Basic"
  sku_size                = "B1"
  runtime                 = "NODE|18-lts"
  user_assigned_identity_id = module.identity.identity_id
  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
    ENVIRONMENT              = "dev"
  }
  tags = var.tags
}


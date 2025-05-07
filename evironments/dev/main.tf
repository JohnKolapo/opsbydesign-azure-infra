provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dns" {
  name     = "rg-opsbydesign-dns"
  location = "Canada Central"
}

resource "azurerm_dns_zone" "main" {
  name                = "opsbydesign.ca"
  resource_group_name = azurerm_resource_group.dns.name
}


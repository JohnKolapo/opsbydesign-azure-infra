# modules/vnet/main.tf

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsgs" {
  for_each = var.nsgs

  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each = var.nsg_associations

  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.value].id
}

PS C:\users\kkolapo\projects\opsbydesign-azure-infra\modules\environments\dev> terraform init

Initializing the backend...
Initializing modules...
- app_service in ..\..\..\modules\app_service
- compute_vm in ..\..\..\modules\compute
- identity in ..\..\..\modules\identity
- nsg in ..\..\..\modules\nsg
- vnet in ..\..\..\modules\vnet
- vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
- vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet in ..\..\..\modules\vnet
╷
│ Error: Failed to remove local module cache
│
│ Terraform tried to remove
│ .terraform\modules\vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet
│ in order to reinstall this module, but encountered an error: CreateFile
│ .terraform\modules\vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet.vnet:
│ The filename, directory name, or volume label syntax is incorrect.
╵

╷
│ Error: Invalid block definition
│
│   on ..\..\..\modules\nsg\main.tf line 13, in resource "azurerm_network_security_rule" "this":
│   13:   for rule in each.value : rule.name => rule
│
│ Either a quoted string block label or an opening brace ("{") is expected here.
╵

PS C:\users\kkolapo\projects\opsbydesign-azure-infra\modules\environments\dev> terraform validate
╷
│ Error: Invalid block definition
│
│   on ..\..\..\modules\nsg\main.tf line 13, in resource "azurerm_network_security_rule" "this":
│   13:   for rule in each.value : rule.name => rule
│
│ Either a quoted string block label or an opening brace ("{") is expected here.
╵
╷
│ Error: Module not installed
│
│   on ..\..\..\modules\vnet\main.tf line 51:
│   51: module "vnet" {
│
│ This module is not yet installed. Run "terraform init" to install all modules required by this configuration.
╵
PS C:\users\kkolapo\projects\opsbydesign-azure-infra\modules\environments\dev>  nsgs = {
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

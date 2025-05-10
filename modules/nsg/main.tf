# modules/nsg/main.tf

resource "azurerm_network_security_group" "this" {
  for_each            = var.nsgs
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "this" {
  for_each                    = { for k, v in var.nsgs : k => v.security_rules }
  for rule in each.value : rule.name => rule

  name                        = rule.key
  priority                    = rule.value.priority
  direction                   = rule.value.direction
  access                      = rule.value.access
  protocol                    = rule.value.protocol
  source_port_range           = rule.value.source_port_range
  destination_port_range      = rule.value.destination_port_range
  source_address_prefix       = rule.value.source_address_prefix
  destination_address_prefix  = rule.value.destination_address_prefix

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this[each.key].name
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.nsg_associations

  subnet_id                 = each.value
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}

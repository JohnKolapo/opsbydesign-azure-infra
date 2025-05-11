resource "azurerm_network_security_group" "this" {
  for_each            = var.nsgs
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Flatten NSG + Rules
locals {
  nsg_rules_flat = flatten([
    for nsg_name, nsg in var.nsgs : [
      for rule in nsg.security_rules : {
        key       = "${nsg_name}-${rule.name}"
        nsg_name  = nsg_name
        rule_data = rule
      }
    ]
  ])
}

resource "azurerm_network_security_rule" "this" {
  for_each = {
    for r in local.nsg_rules_flat : r.key => {
      nsg_name  = r.nsg_name
      rule_data = r.rule_data
    }
  }

  name                        = each.value.rule_data.name
  priority                    = each.value.rule_data.priority
  direction                   = each.value.rule_data.direction
  access                      = each.value.rule_data.access
  protocol                    = each.value.rule_data.protocol
  source_port_range           = each.value.rule_data.source_port_range
  destination_port_range      = each.value.rule_data.destination_port_range
  source_address_prefix       = each.value.rule_data.source_address_prefix
  destination_address_prefix  = each.value.rule_data.destination_address_prefix
  network_security_group_name = each.value.nsg_name
  resource_group_name         = var.resource_group_name
}

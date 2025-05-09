variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where VNet will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "CIDR block for the VNet"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnet objects with keys as subnet names"
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "nsgs" {
  description = "Map of NSGs to create"
  type = map(object({
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "nsg_associations" {
  description = "Map of subnet-to-NSG associations"
  type        = map(string)
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
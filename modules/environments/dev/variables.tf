variable "dns_zone_name" {
  description = "The name of the DNS zone."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region."
  type        = string
}

variable "records" {
  description = "DNS records"
  type = map(object({
    type    = string
    ttl     = number
    records = list(string)
  }))
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "nsgs" {
  description = "Network security groups to apply"
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
  description = "Map of subnet names to NSG names"
  type        = map(string)
}

variable "admin_username" {
  description = "Username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Password for the VM"
  type        = string
}

variable "role_assignments" {
  description = "Role assignments for managed identity"
  type = map(object({
    scope = string
    role  = string
  }))
}

variable "address_space" {
  description = "CIDR block for the VNet"
  type        = list(string)
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}

variable "runtime" {
  description = "Runtime stack for App Service"
  type        = string
}

variable "subnets" {
  description = "Map of subnet objects with keys as subnet names"
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "sku_tier" {
  description = "SKU Tier for App Service"
  type        = string
}

variable "sku_size" {
  description = "SKU Size for App Service"
  type        = string
}

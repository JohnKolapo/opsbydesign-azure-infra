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
  description = "A map of DNS records."
  type        = map(string)
}


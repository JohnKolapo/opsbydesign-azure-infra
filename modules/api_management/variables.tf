# modules/api_management/variables.tf

variable "name" {
  description = "Name of the API Management instance"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "publisher_name" {
  description = "Name of the publisher"
  type        = string
}

variable "publisher_email" {
  description = "Email of the publisher"
  type        = string
}

variable "sku_name" {
  description = "SKU name (Developer, Basic, Standard, Premium)"
  type        = string
  default     = "Developer_1"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name of the App Service (and base for App Service Plan)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sku_tier" {
  description = "Pricing tier for App Service Plan (e.g., Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "sku_size" {
  description = "Size within the tier (e.g., B1, S1, P1v2)"
  type        = string
  default     = "B1"
}

variable "runtime" {
  description = "Runtime stack for Linux App Service (e.g., DOTNETCORE|6.0, NODE|18-lts)"
  type        = string
  default     = "NODE|18-lts"
}

variable "app_settings" {
  description = "Key-value map of App Settings"
  type        = map(string)
  default     = {}
}

variable "user_assigned_identity_id" {
  description = "ID of the managed identity to assign"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

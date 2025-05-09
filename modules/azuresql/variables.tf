# modules/azuresql/variables.tf

variable "server_name" {
  description = "SQL server name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group"
  type        = string
}

variable "admin_username" {
  description = "SQL admin username"
  type        = string
}

variable "admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "SQL database name"
  type        = string
}

variable "sku_name" {
  description = "Database SKU (e.g., Basic, S0, P1)"
  type        = string
  default     = "S0"
}

variable "max_size_gb" {
  description = "Max size in GB"
  type        = number
  default     = 5
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}


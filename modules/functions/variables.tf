# modules/functions/variables.tf

variable "function_app_name" {
  description = "Name of the Function App"
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

variable "service_plan_name" {
  description = "Name of the App Service plan"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "runtime" {
  description = "Function runtime (e.g., node, dotnet, python)"
  type        = string
}

variable "app_settings" {
  description = "Additional app settings for the Function App"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}


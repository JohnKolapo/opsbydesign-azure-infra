# modules/app_insights/variables.tf

variable "name" {
  description = "Name of the App Insights instance"
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

variable "application_type" {
  description = "Type of application (Web, Other)"
  type        = string
  default     = "web"
}

variable "retention_in_days" {
  description = "Retention period in days"
  type        = number
  default     = 90
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}

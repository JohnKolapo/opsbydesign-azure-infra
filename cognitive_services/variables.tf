# modules/cognitive_services/variables.tf

variable "name" {
  description = "Name of the Cognitive Services account"
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

variable "kind" {
  description = "Type of cognitive service (e.g., CognitiveServices, OpenAI)"
  type        = string
  default     = "CognitiveServices"
}

variable "sku_name" {
  description = "SKU (e.g., S0, S1)"
  type        = string
  default     = "S0"
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
  default     = {}
}

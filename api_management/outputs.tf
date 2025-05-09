# modules/api_management/outputs.tf

output "api_management_id" {
  description = "ID of the API Management instance"
  value       = azurerm_api_management.this.id
}

output "api_management_name" {
  description = "Name of the API Management instance"
  value       = azurerm_api_management.this.name
}


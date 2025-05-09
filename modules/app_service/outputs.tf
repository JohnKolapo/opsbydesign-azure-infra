output "app_service_name" {
  description = "Name of the deployed App Service"
  value       = azurerm_app_service.this.name
}

output "app_service_id" {
  description = "ID of the deployed App Service"
  value       = azurerm_app_service.this.id
}

output "app_service_id" {
  description = "ID of the App Service"
  value       = azurerm_app_service.this.id
}

output "app_service_name" {
  description = "Name of the App Service"
  value       = azurerm_app_service.this.name
}

output "default_hostname" {
  description = "Default hostname of the App Service"
  value       = azurerm_app_service.this.default_site_hostname
}

output "plan_id" {
  description = "ID of the App Service Plan"
  value       = azurerm_app_service_plan.this.id
}

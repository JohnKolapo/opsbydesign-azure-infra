# modules/functions/outputs.tf

output "function_app_id" {
  description = "ID of the Function App"
  value       = azurerm_function_app.this.id
}

output "function_app_name" {
  description = "Name of the Function App"
  value       = azurerm_function_app.this.name
}


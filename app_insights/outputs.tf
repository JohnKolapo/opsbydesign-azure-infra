# modules/app_insights/outputs.tf

output "app_insights_id" {
  description = "ID of the App Insights instance"
  value       = azurerm_application_insights.this.id
}

output "app_insights_instrumentation_key" {
  description = "Instrumentation key"
  value       = azurerm_application_insights.this.instrumentation_key
}


# modules/cognitive_services/outputs.tf

output "cognitive_account_id" {
  description = "ID of the Cognitive Services account"
  value       = azurerm_cognitive_account.this.id
}

output "cognitive_account_name" {
  description = "Name of the Cognitive Services account"
  value       = azurerm_cognitive_account.this.name
}


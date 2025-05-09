# modules/cosmosdb/outputs.tf

output "cosmosdb_account_name" {
  description = "CosmosDB account name"
  value       = azurerm_cosmosdb_account.this.name
}

output "cosmosdb_account_id" {
  description = "CosmosDB account ID"
  value       = azurerm_cosmosdb_account.this.id
}

# modules/azuresql/outputs.tf

output "sql_server_name" {
  description = "SQL Server name"
  value       = azurerm_mssql_server.this.name
}

output "sql_database_name" {
  description = "SQL Database name"
  value       = azurerm_mssql_database.this.name
}


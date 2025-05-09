# modules/azuresql/README.md

# Azure SQL Module

This module deploys an Azure SQL Server and Database.

## Features
- MSSQL Server with admin credentials
- Flexible SKU + size for the DB

## Inputs
| Name               | Description                     | Type        | Default |
|--------------------|---------------------------------|-------------|---------|
| server_name        | SQL Server name                 | string      | n/a     |
| location           | Azure region                    | string      | n/a     |
| resource_group_name| Resource group                  | string      | n/a     |
| admin_username     | SQL admin username              | string      | n/a     |
| admin_password     | SQL admin password (sensitive)  | string      | n/a     |
| db_name            | SQL Database name               | string      | n/a     |
| sku_name           | SKU (e.g., S0, Basic)           | string      | S0      |
| max_size_gb        | DB size in GB                   | number      | 5       |
| tags               | Resource tags                   | map(string) | {}      |

## Outputs
| Name              | Description          |
|-------------------|----------------------|
| sql_server_name   | SQL Server name      |
| sql_database_name | SQL DB name          |

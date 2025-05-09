# Cosmos DB Module

This module creates a serverless Azure Cosmos DB account.

## Features
- Serverless mode
- Session consistency
- Auto-failover enabled

## Inputs
| Name                | Description                  | Type        | Default |
|---------------------|------------------------------|-------------|---------|
| name                | CosmosDB account name        | string      | n/a     |
| location            | Azure region                 | string      | n/a     |
| resource_group_name | Resource group for deployment| string      | n/a     |
| tags                | Resource tags                | map(string) | {}      |

## Outputs
| Name                 | Description               |
|----------------------|---------------------------|
| cosmosdb_account_name| CosmosDB name             |
| cosmosdb_account_id  | CosmosDB resource ID      |

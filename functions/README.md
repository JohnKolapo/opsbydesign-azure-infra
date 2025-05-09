# Azure Function App Module

This module deploys an Azure Function App using a Consumption Plan.

## Features
- Creates Storage Account for backend storage
- System-assigned Managed Identity
- Dynamic App Service Plan
- Supports additional custom app settings

## Inputs
| Name                   | Description                         | Type         | Default |
|------------------------|-------------------------------------|--------------|---------|
| function_app_name      | Name of the Function App            | string       | n/a     |
| location               | Azure region                        | string       | n/a     |
| resource_group_name    | Resource group name                 | string       | n/a     |
| service_plan_name      | App Service Plan name               | string       | n/a     |
| storage_account_name   | Storage account for the Function    | string       | n/a     |
| runtime                | Function runtime (node, dotnet, etc)| string       | n/a     |
| app_settings           | Additional app settings             | map(string)  | {}      |
| tags                   | Tags for resources                  | map(string)  | {}      |

## Outputs
| Name              | Description              |
|-------------------|--------------------------|
| function_app_id   | ID of the Function App   |
| function_app_name | Name of the Function App |


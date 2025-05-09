# modules/cognitive_services/README.md

# Azure Cognitive Services Module

This module deploys a Cognitive Services resource.

## Features
- Supports custom kinds (OpenAI, LUIS, etc.)
- Fully tagged
- S0 tier by default

## Inputs
| Name                | Description                        | Type        | Default            |
|---------------------|------------------------------------|-------------|--------------------|
| name                | Cognitive account name             | string      | n/a                |
| location            | Azure region                       | string      | n/a                |
| resource_group_name | Resource group for deployment      | string      | n/a                |
| kind                | Cognitive service kind             | string      | CognitiveServices  |
| sku_name            | SKU tier                           | string      | S0                 |
| tags                | Resource tags                      | map(string) | {}                 |

## Outputs
| Name                   | Description                        |
|------------------------|------------------------------------|
| cognitive_account_id   | ID of the Cognitive resource       |
| cognitive_account_name | Name of the Cognitive resource     |

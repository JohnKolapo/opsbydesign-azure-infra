# modules/api_management/README.md

# API Management Module

This module deploys an Azure API Management instance.

## Features
- Supports all SKU tiers (Developer, Basic, Standard, Premium)
- Custom publisher info
- Resource tagging

## Inputs
| Name               | Description                       | Type        | Default        |
|--------------------|-----------------------------------|-------------|----------------|
| name               | Name of the APIM instance         | string      | n/a            |
| location           | Azure region                      | string      | n/a            |
| resource_group_name| Target resource group             | string      | n/a            |
| publisher_name     | API publisher name                | string      | n/a            |
| publisher_email    | API publisher email               | string      | n/a            |
| sku_name           | APIM pricing tier                 | string      | Developer_1    |
| tags               | Tags to apply to the resource     | map(string) | {}             |

## Outputs
| Name                | Description                         |
|---------------------|-------------------------------------|
| api_management_id   | ID of the APIM resource             |
| api_management_name | Name of the APIM resource           |


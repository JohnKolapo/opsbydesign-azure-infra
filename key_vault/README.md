# Key Vault Module

This module creates a secure Azure Key Vault.

## Features
- RBAC or access policy-based authorization
- Soft delete and purge protection enabled
- Disk encryption support

## Inputs
| Name                    | Description                        | Type   | Default     |
|-------------------------|------------------------------------|--------|-------------|
| name                    | Name of the Key Vault              | string | n/a         |
| location                | Azure location                     | string | n/a         |
| resource_group_name     | Target resource group              | string | n/a         |
| tenant_id               | Azure AD tenant ID                 | string | n/a         |
| sku_name                | SKU name (standard or premium)     | string | "standard"  |
| enable_rbac_authorization | Enable RBAC instead of policies   | bool   | false       |
| access_policies         | List of access policies            | list   | []          |
| tags                    | Resource tags                      | map    | {}          |

## Outputs
| Name            | Description             |
|-----------------|-------------------------|
| key_vault_id    | Key Vault resource ID   |
| key_vault_uri   | Key Vault URI for apps  |

# modules/app_insights/README.md

# App Insights Module

This module provisions an Azure Application Insights instance.

## Features
- Web app performance monitoring
- Custom retention period
- Instrumentation key output

## Inputs
| Name               | Description                          | Type        | Default |
|--------------------|--------------------------------------|-------------|---------|
| name               | Name of the App Insights instance    | string      | n/a     |
| location           | Azure region                         | string      | n/a     |
| resource_group_name| Resource group name                  | string      | n/a     |
| application_type   | Type of app (Web, Other)             | string      | web     |
| retention_in_days  | Retention period in days             | number      | 90      |
| tags               | Resource tags                        | map(string) | {}      |

## Outputs
| Name                           | Description                  |
|--------------------------------|------------------------------|
| app_insights_id               | Resource ID                  |
| app_insights_instrumentation_key | Key for telemetry           |

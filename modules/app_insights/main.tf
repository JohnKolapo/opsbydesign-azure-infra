# modules/app_insights/main.tf

resource "azurerm_application_insights" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  retention_in_days   = var.retention_in_days

  tags = var.tags
}

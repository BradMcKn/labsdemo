# ResourceGroup.tf - Subscription and Resource Group Configuration

# Data source to reference the current Azure subscription
data "azurerm_subscription" "current" {
}

# Primary resource group for the App Service deployment
resource "azurerm_resource_group" "primary region" {
    name = var.primary_resource_group_name
    location = var.primary_location
}

# Secondary resource group for geo-redundant deployment
resource "azAppServiceTeplatemplateRG2" "secondary region" {
    name = var.secondary_resource_group_name
    location = var.secondary_location
}
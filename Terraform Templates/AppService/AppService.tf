# AppService.tf - App Service Plan and App Service Configuration

# Primary App Service Plan (East US)
resource "azurerm_app_service_plan" "azAppServiceTemplatePlan1" {
  name                = "${var.app_service_plan_name}-primary"
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
  
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }

  tags = var.tags
}

# Secondary App Service Plan (West US)
resource "azurerm_app_service_plan" "azAppServiceTemplatePlan2" {
  name                = "${var.app_service_plan_name}-secondary"
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name
  
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }

  tags = var.tags
}
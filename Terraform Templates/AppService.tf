# AppService.tf is where the Azure App Service and App Service Plan resources are defined.
# I will go by each one of these resources and explain their purpose. 
# This could be used as a template

# declares the terraform resource, "resource_group" and identifier name this can also be a module as well
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# declares the terraform resource, "app_service_plan" and identifier name this also includes the location and the resource group it belongs to, also ensure you select the correct teir and size.
resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tags                = var.tags

  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

# declares the terraform resource, "app_service" and identifier name this includes the location, resource group, and app service plan it belongs to. Also includes site configuration, app settings, and connection strings.
resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  tags                = var.tags

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
    scm_type                 = var.scm_type
  }
# Site settings allow you to define key-value pairs for application settings
  app_settings = var.app_settings

# connection_string block allows you to define database connection strings you can use Service Principals or Managed Identities for better security but don't expose actual value in code call it via Key Vault or other secure methods.
  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = var.connection_string_value
  }
}
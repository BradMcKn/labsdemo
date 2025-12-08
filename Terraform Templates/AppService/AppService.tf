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

# Primary App Service (East US)
resource "azurerm_app_service" "azAppServiceTemplate1" {
  name                = "${var.app_service_name}-primary"
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.azAppServiceTemplatePlan1.id

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
    # scm_type is used if you're using GitHub/Git SCM to push code directly to the app
    # Not needed when deploying via Azure DevOps tasks (AzureWebApp@1, AzureRmWebAppDeployment)
    # scm_type                 = var.scm_type
  }

  app_settings = var.app_settings

  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = "Server=tcp:${var.sql_server_fqdn},1433;Database=${var.sql_database_name};Authentication=Active Directory Service Principal;User ID=${var.spn_client_id};Password=${var.spn_client_secret};Encrypt=true;"
  }

  tags = var.tags
}

# Primary App Service Slot - Staging (East US)
resource "azurerm_app_service_slot" "azAppServiceSlot1_staging" {
  name                = "staging"
  app_service_name    = azurerm_app_service.azAppServiceTemplate1.name
  location            = var.primary_location
  resource_group_name = var.primary_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.azAppServiceTemplatePlan1.id

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
    # scm_type is used if you're using GitHub/Git SCM to push code directly to the app
    # Not needed when deploying via Azure DevOps tasks (AzureWebApp@1, AzureRmWebAppDeployment)
    # scm_type                 = var.scm_type
  }

  app_settings = var.app_settings

  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = "Server=tcp:${var.sql_server_fqdn},1433;Database=${var.sql_database_name};Authentication=Active Directory Service Principal;User ID=${var.spn_client_id};Password=${var.spn_client_secret};Encrypt=true;"
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

# Secondary App Service (West US)
resource "azurerm_app_service" "azAppServiceTemplate2" {
  name                = "${var.app_service_name}-secondary"
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.azAppServiceTemplatePlan2.id

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
    # scm_type is used if you're using GitHub/Git SCM to push code directly to the app
    # Not needed when deploying via Azure DevOps tasks (AzureWebApp@1, AzureRmWebAppDeployment)
    # scm_type                 = var.scm_type
  }

  app_settings = var.app_settings

  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = "Server=tcp:${var.sql_server_fqdn},1433;Database=${var.sql_database_name};Authentication=Active Directory Service Principal;User ID=${var.spn_client_id};Password=${var.spn_client_secret};Encrypt=true;"
  }

  tags = var.tags
}

# Secondary App Service Slot - Staging (West US)
resource "azurerm_app_service_slot" "azAppServiceSlot2_staging" {
  name                = "staging"
  app_service_name    = azurerm_app_service.azAppServiceTemplate2.name
  location            = var.secondary_location
  resource_group_name = var.secondary_resource_group_name
  app_service_plan_id = azurerm_app_service_plan.azAppServiceTemplatePlan2.id

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
    # scm_type is used if you're using GitHub/Git SCM to push code directly to the app
    # Not needed when deploying via Azure DevOps tasks (AzureWebApp@1, AzureRmWebAppDeployment)
    # scm_type                 = var.scm_type
  }

  app_settings = var.app_settings

  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = "Server=tcp:${var.sql_server_fqdn},1433;Database=${var.sql_database_name};Authentication=Active Directory Service Principal;User ID=${var.spn_client_id};Password=${var.spn_client_secret};Encrypt=true;"
  }

  tags = var.tags
}
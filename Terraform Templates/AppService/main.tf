# main.tf - Azure App Service Terraform Template
# This is the main configuration file that orchestrates all resources

# Module: Resource Groups
# Creates primary and secondary resource groups for geo-redundant deployment
module "resource_groups" {
  source = "./ResourceGroup"
  
  primary_resource_group_name   = var.primary_resource_group_name
  primary_location              = var.primary_location
  secondary_resource_group_name = var.secondary_resource_group_name
  secondary_location            = var.secondary_location
  tags                          = var.tags
}

# Module: App Service Plans
# Creates primary and secondary App Service Plans
module "app_service_plans" {
  source = "./AppServicePlan"
  
  app_service_plan_name = var.app_service_plan_name
  app_service_plan_tier = var.app_service_plan_tier
  app_service_plan_size = var.app_service_plan_size
  
  primary_location              = var.primary_location
  primary_resource_group_name   = module.resource_groups.primary_resource_group_name
  secondary_location            = var.secondary_location
  secondary_resource_group_name = module.resource_groups.secondary_resource_group_name
  
  tags = var.tags
  
  depends_on = [module.resource_groups]
}

# Module: App Services
# Creates primary and secondary App Services with connection strings
module "app_services" {
  source = "./AppService"
  
  app_service_name         = var.app_service_name
  dotnet_framework_version = var.dotnet_framework_version
  
  primary_location              = var.primary_location
  primary_resource_group_name   = module.resource_groups.primary_resource_group_name
  primary_app_service_plan_id   = module.app_service_plans.primary_app_service_plan_id
  
  secondary_location            = var.secondary_location
  secondary_resource_group_name = module.resource_groups.secondary_resource_group_name
  secondary_app_service_plan_id = module.app_service_plans.secondary_app_service_plan_id
  
  app_settings           = var.app_settings
  connection_string_name = var.connection_string_name
  connection_string_type = var.connection_string_type
  
  # SQL Server connection with Service Principal
  sql_server_fqdn    = var.sql_server_fqdn
  sql_database_name  = var.sql_database_name
  spn_client_id      = var.spn_client_id
  spn_client_secret  = var.spn_client_secret
  
  tags = var.tags
  
  depends_on = [module.app_service_plans]
}

# Module: App Service Slots
# Creates staging slots for blue-green deployments
module "app_service_slots" {
  source = "./AppServiceSlot"
  count  = var.enable_staging_slot ? 1 : 0
  
  staging_slot_name        = var.staging_slot_name
  dotnet_framework_version = var.dotnet_framework_version
  
  primary_app_service_name      = module.app_services.primary_app_service_name
  primary_location              = var.primary_location
  primary_resource_group_name   = module.resource_groups.primary_resource_group_name
  primary_app_service_plan_id   = module.app_service_plans.primary_app_service_plan_id
  
  secondary_app_service_name    = module.app_services.secondary_app_service_name
  secondary_location            = var.secondary_location
  secondary_resource_group_name = module.resource_groups.secondary_resource_group_name
  secondary_app_service_plan_id = module.app_service_plans.secondary_app_service_plan_id
  
  app_settings           = var.app_settings
  connection_string_name = var.connection_string_name
  connection_string_type = var.connection_string_type
  
  # SQL Server connection with Service Principal
  sql_server_fqdn    = var.sql_server_fqdn
  sql_database_name  = var.sql_database_name
  spn_client_id      = var.spn_client_id
  spn_client_secret  = var.spn_client_secret
  
  tags = var.tags
  
  depends_on = [module.app_services]
}

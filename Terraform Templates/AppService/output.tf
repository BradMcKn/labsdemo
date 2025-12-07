# output.tf - Output Values for App Service Template
# This file defines all output values that will be displayed after terraform apply

# ========================================
# SUBSCRIPTION OUTPUTS
# ========================================
# Displays the current Azure subscription information

output "subscription_id" {
  description = "ID of the Azure subscription"
  value       = data.azurerm_subscription.current.subscription_id
}

output "subscription_display_name" {
  description = "Display name of the Azure subscription"
  value       = data.azurerm_subscription.current.display_name
}

# ========================================
# PRIMARY RESOURCE GROUP OUTPUTS
# ========================================
# Outputs for the primary resource group (East US)

output "primary_resource_group_name" {
  description = "Name of the primary resource group"
  value       = azurerm_resource_group["primary region"].name
}

output "primary_resource_group_id" {
  description = "ID of the primary resource group"
  value       = azurerm_resource_group["primary region"].id
}

output "primary_resource_group_location" {
  description = "Location of the primary resource group"
  value       = azurerm_resource_group["primary region"].location
}

# ========================================
# SECONDARY RESOURCE GROUP OUTPUTS
# ========================================
# Outputs for the secondary resource group (West US) for geo-redundancy

output "secondary_resource_group_name" {
  description = "Name of the secondary resource group"
  value       = azAppServiceTeplatemplateRG2["secondary region"].name
}

output "secondary_resource_group_id" {
  description = "ID of the secondary resource group"
  value       = azAppServiceTeplatemplateRG2["secondary region"].id
}

output "secondary_resource_group_location" {
  description = "Location of the secondary resource group"
  value       = azAppServiceTeplatemplateRG2["secondary region"].location
}

# ========================================
# PRIMARY APP SERVICE PLAN OUTPUTS
# ========================================
# Outputs for the primary App Service Plan (East US)

output "primary_app_service_plan_id" {
  description = "ID of the primary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan1.id
}

output "primary_app_service_plan_name" {
  description = "Name of the primary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan1.name
}

output "primary_app_service_plan_tier" {
  description = "Pricing tier of the primary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan1.sku[0].tier
}

output "primary_app_service_plan_size" {
  description = "Size/SKU of the primary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan1.sku[0].size
}

# ========================================
# SECONDARY APP SERVICE PLAN OUTPUTS
# ========================================
# Outputs for the secondary App Service Plan (West US) for geo-redundancy

output "secondary_app_service_plan_id" {
  description = "ID of the secondary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan2.id
}

output "secondary_app_service_plan_name" {
  description = "Name of the secondary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan2.name
}

output "secondary_app_service_plan_tier" {
  description = "Pricing tier of the secondary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan2.sku[0].tier
}

output "secondary_app_service_plan_size" {
  description = "Size/SKU of the secondary App Service Plan"
  value       = azurerm_app_service_plan.azAppServiceTemplatePlan2.sku[0].size
}


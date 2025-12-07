# vars.tfvars - Variable Values for App Service Template
# This file contains the actual values for variables defined in variables.tf

# ========================================
# RESOURCE GROUP VARIABLES
# ========================================
primary_resource_group_name   = "app-service-primary-rg"
primary_location              = "eastus"
secondary_resource_group_name = "app-service-secondary-rg"
secondary_location            = "westus"

# ========================================
# APP SERVICE PLAN VARIABLES
# ========================================
app_service_plan_name = "app-service-plan"
app_service_plan_tier = "PremiumV2"
app_service_plan_size = "P1V2"

# ========================================
# TAGGING VARIABLES
# ========================================
tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "AppService"
  Owner       = "DevOps"
}

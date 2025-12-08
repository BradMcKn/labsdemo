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
# APP SERVICE VARIABLES
# ========================================
app_service_name         = "myapp-service"
dotnet_framework_version = "v6.0"

# ========================================
# APP SERVICE SLOT VARIABLES
# ========================================
enable_staging_slot = true
staging_slot_name   = "staging"

# scm_type is used if you're using GitHub/Git SCM to push code directly to the app
# Not needed when deploying via Azure DevOps tasks
# scm_type                 = "LocalGit"

# ========================================
# APP SETTINGS VARIABLES
# ========================================
app_settings = {
  "ENVIRONMENT"           = "Production"
  "APPINSIGHTS_ENABLED"   = "true"
  "WEBSITE_NODE_DEFAULT_VERSION" = "~18"
}

# ========================================
# CONNECTION STRING VARIABLES
# ========================================
connection_string_name  = "Database"
connection_string_type  = "SQLAzure"

# SQL Server connection details
sql_server_fqdn        = "myserver.database.windows.net"
sql_database_name      = "mydb"

# Service Principal credentials for SQL authentication
# IMPORTANT: Do NOT commit these values to source control!
# Pass these as environment variables or use terraform.tfvars (gitignored)
# Example: terraform apply -var="spn_client_id=xxx" -var="spn_client_secret=yyy"
spn_client_id          = ""  # Set via environment variable TF_VAR_spn_client_id
spn_client_secret      = ""  # Set via environment variable TF_VAR_spn_client_secret

# ========================================
# TAGGING VARIABLES
# ========================================
tags = {
  Environment = "Production"
  ManagedBy   = "Terraform"
  Project     = "AppService"
  Owner       = "DevOps"
  CostCenter  = "Engineering"
}

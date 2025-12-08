# Variables for App Service Terraform Template
# This file defines all configurable parameters for the App Service deployment

# ========================================
# RESOURCE GROUP VARIABLES
# ========================================

variable "primary_resource_group_name" {
  description = "Name of the primary Azure resource group (East US)"
  type        = string
  default     = "app-service-primary-rg"
}

variable "primary_location" {
  description = "Primary Azure region for resources (e.g., East US)"
  type        = string
  default     = "eastus"
}

variable "secondary_resource_group_name" {
  description = "Name of the secondary Azure resource group for geo-redundancy (West US)"
  type        = string
  default     = "app-service-secondary-rg"
}

variable "secondary_location" {
  description = "Secondary Azure region for geo-redundancy (e.g., West US)"
  type        = string
  default     = "westus"
}

# Legacy resource group variables (for backward compatibility)
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "app-service-rg"
}

variable "location" {
  description = "Azure region where resources will be deployed (e.g., West Europe, East US, Central US)"
  type        = string
  default     = "West Europe"
}

# ========================================
# APP SERVICE PLAN VARIABLES
# ========================================
# For pricing and SKU details, see: https://azure.microsoft.com/en-us/pricing/calculator/

variable "app_service_plan_name" {
  description = "Name of the App Service Plan (must be unique within subscription)"
  type        = string
  default     = "app-service-plan"
}

variable "app_service_plan_tier" {
  description = "Pricing tier for App Service Plan. Options: Free, Basic, Standard, Premium, PremiumV2, PremiumV3, Isolated"
  type        = string
  default     = "PremiumV2"
  
  validation {
    condition     = contains(["Free", "Basic", "Standard", "Premium", "PremiumV2", "PremiumV3", "Isolated"], var.app_service_plan_tier)
    error_message = "Tier must be one of: Free, Basic, Standard, Premium, PremiumV2, PremiumV3, Isolated"
  }
}

variable "app_service_plan_size" {
  description = "Size/SKU of the App Service Plan. Free: F1, Basic: B1-B3, Standard: S1-S3, Premium: P1-P3, PremiumV2: P1V2-P3V2, PremiumV3: P1V3-P3V3"
  type        = string
  default     = "P1V2"
}

# ========================================
# APP SERVICE VARIABLES
# ========================================

variable "app_service_name" {
  description = "Name of the App Service (must be globally unique across Azure)"
  type        = string
  default     = "myapp-service"
}

variable "dotnet_framework_version" {
  description = ".NET Framework version (e.g., v4.0, v6.0, v7.0)"
  type        = string
  default     = "v6.0"
}

# scm_type is used if you're using GitHub/Git SCM to push code directly to the app
# Not needed when deploying via Azure DevOps tasks (AzureWebApp@1, AzureRmWebAppDeployment)
# variable "scm_type" {
#   description = "Source Control Management type (e.g., LocalGit, GitHub, VSTSRM, None)"
#   type        = string
#   default     = "LocalGit"
# }

# ========================================
# APP SETTINGS VARIABLES
# ========================================

variable "app_settings" {
  description = "Map of application settings (environment variables) for the App Service"
  type        = map(string)
  default = {
    "ENVIRONMENT"         = "Production"
    "APPINSIGHTS_ENABLED" = "true"
  }
}

# ========================================
# CONNECTION STRING VARIABLES
# ========================================

variable "connection_string_name" {
  description = "Name of the connection string"
  type        = string
  default     = "Database"
}

variable "connection_string_type" {
  description = "Type of connection string (SQLServer, SQLAzure, Custom, MySQL, PostgreSQL)"
  type        = string
  default     = "SQLAzure"
}

# SQL Server connection variables for SPN authentication
variable "sql_server_fqdn" {
  description = "Fully qualified domain name of the Azure SQL Server (e.g., myserver.database.windows.net)"
  type        = string
  default     = "myserver.database.windows.net"
}

variable "sql_database_name" {
  description = "Name of the Azure SQL Database"
  type        = string
  default     = "mydb"
}

variable "spn_client_id" {
  description = "Service Principal (Azure AD App Registration) Client ID for SQL authentication"
  type        = string
  sensitive   = true
}

variable "spn_client_secret" {
  description = "Service Principal (Azure AD App Registration) Client Secret for SQL authentication"
  type        = string
  sensitive   = true
}

# ========================================
# TAGGING VARIABLES
# ========================================

variable "tags" {
  description = "Tags to apply to all resources for organization and cost tracking"
  type        = map(string)
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Project     = "AppService"
    Owner       = "DevOps"
  }
}

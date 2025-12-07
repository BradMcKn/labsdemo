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
}


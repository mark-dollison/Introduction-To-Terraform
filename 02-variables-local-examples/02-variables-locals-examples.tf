################################################
# Block-1: Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

################################################
# Block-2: Providers Block
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

################################################
# Variables
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  #default     = "myrg-001"
}

variable "resource_group_location" {
  default = "westus2"
}


################################################
# Block: Resource Block using variables
resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

################################################
# Local values
locals {
  rg_name     = "rg-${var.resource_group_name}-${var.resource_group_location}-002"
  rg_location = var.resource_group_location
}

################################################
# Block: Resource Block using Local values
resource "azurerm_resource_group" "myrg2" {
  name     = local.rg_name
  location = local.rg_location
}


################################################
# Block: Data sources block
data "azurerm_resource_group" "example" {
  name = "existing-rg-001"
}

# Output id of existing Resource Group using Data Source block
output "id" {
  description = "ID of the Resource Group"
  value       = data.azurerm_resource_group.example.id
}

# Output location of existing Resource Group using Data Source block
output "location" {
  description = "Location of Resource Group"
  value       = data.azurerm_resource_group.example.location
}

########################################################
# Output information on the newly created Resource Group
########################################################
output "rg1_id" {
  description = "ID of the Resource Group"
  value       = azurerm_resource_group.myrg.id
}

output "rg1_location" {
  description = "Location of Resource Group"
  value       = azurerm_resource_group.myrg.location
}

output "rg2_id" {
  description = "ID of the Resource Group"
  value       = azurerm_resource_group.myrg2.id
}

output "rg2_location" {
  description = "Location of Resource Group"
  value       = azurerm_resource_group.myrg2.location
}





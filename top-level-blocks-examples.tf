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
}


################################################
# Block: Resource Block
resource "azurerm_resource_group" "myrg" {
  name     = "myrg-001"
  location = "westus2"
}


################################################
# Block: Data sources block
data "azurerm_resource_group" "example" {
  name = "existing-rg-001"
}

output "id" {
  value = data.azurerm_resource_group.example.id
}

output "location" {
  value = data.azurerm_resource_group.example.location
}

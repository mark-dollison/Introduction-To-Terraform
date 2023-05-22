################################################
# Block-1: Terraform Settings Block
terraform {
   required_providers {
     azurerm = {
        source = "hashicorp/azurerm"
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
  name = "myrg-001"
  location = "westus2"
}
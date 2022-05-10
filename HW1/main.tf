variable "client_secret" {}

#-----------------------------------------------------------------------
# Providers configuration
#-----------------------------------------------------------------------
provider "azurerm" {
  features {}

  subscription_id = "57403a3c-0cbd-4b93-b8ce-b8ebe863efb0"
  client_id = "329e2215-3b20-4a5f-8263-2ecb81759eb8"
  client_secret = var.client_secret
  tenant_id = "b41b72d0-4e9f-4c26-8a69-f949f367c91d"
}



#-----------------------------------------------------------------------
# Providers source
#-----------------------------------------------------------------------
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.76.0"
    }
  }
}



#-----------------------------------------------------------------------
# Resource group
#-----------------------------------------------------------------------
resource "azurerm_resource_group" "rg_test" {
  name     = "rg-test"
  location = "West Europe"

  tags = {
    "Owner" = "Albert_Galitsinskiy"
  }
}

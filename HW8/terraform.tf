#-----------------------------------------------------------------------
# Providers source
#-----------------------------------------------------------------------

terraform {
  required_version = ">= 1.1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.76.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.0"
    }
  }

  # Backend in Azure Blob container 
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "hw4tftfstate"
    container_name       = "blob-tfstate"
    key                  = "terraform.tfstate"
  }
}

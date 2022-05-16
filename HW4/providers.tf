#-----------------------------------------------------------------------
# Providers configuration
#-----------------------------------------------------------------------
provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias = "provider2"
}


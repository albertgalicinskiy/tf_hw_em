locals {
  resources_tags = {
    "Owner" = "Albert_Galitsinskiy",
    "Goal"  = "Store_hw4_tfstates"
  }
}

# Creating Resource Group
resource "azurerm_resource_group" "terraform_tfstate_hw4" {
  name = "rg-terraform-state"
  location = "East Asia"

  tags = local.resources_tags
}

# Creating Storage Account
resource "azurerm_storage_account" "hw4tftfstate" {
  name = "hw4tftfstate"
  location = azurerm_resource_group.terraform_tfstate_hw4.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  resource_group_name = azurerm_resource_group.terraform_tfstate_hw4.name

  tags = local.resources_tags
}

# Creating Blob container
resource "azurerm_storage_container" "blob_tfstate" {
  name = "blob-tfstate"
  storage_account_name = azurerm_storage_account.hw4tftfstate.name
  container_access_type = "private"
}

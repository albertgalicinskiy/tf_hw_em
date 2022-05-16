#-----------------------------------------------------------------------
# Resource group
#-----------------------------------------------------------------------
resource "azurerm_resource_group" "rg_apc_kv" {
  name     = "rg-albert-galitsinskiy"
  location = "East Asia"

  tags = {
    "name_surname" = "Albert_Galitsinskiy"
  }
}
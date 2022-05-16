resource "azurerm_app_configuration" "app_configuration" {
  location = azurerm_resource_group.rg_apc_kv.location
  name = "apc-albert-galitsinskiy"
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  sku = "free"

  tags = {
    "name_surname" = "Albert_Galitsinskiy"
  }
}
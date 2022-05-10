resource "azurerm_app_configuration" "app_configuration" {
  location            = var.location
  name                = local.apc_name
  resource_group_name = local.rg_name
  sku                 = var.sku_name

  tags                = local.common_tags

  depends_on          = [
    azurerm_resource_group.rg_apc_kv
  ]
}
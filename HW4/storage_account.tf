resource "azurerm_storage_account" "storage_name_for_env" {
  name                     = local.storage_name
  location                 = var.location
  account_tier             = var.sku_name
  account_replication_type = "LRS"
  resource_group_name      = local.rg_name

  tags = local.common_tags

  depends_on = [
    azurerm_resource_group.rg_apc_kv
  ]
}
resource "azurerm_storage_account" "storage_name_for_env" {
  for_each = var.stor_acc_count
  name                     = "st${local.resource_name_prefix}${var.env}${each.value["name"]}"
  location                 = each.value["region"]
  resource_group_name      = azurerm_resource_group.rg_apc_kv.name
  account_tier             = var.sku_name
  account_replication_type = "LRS"

  tags = local.common_tags
}

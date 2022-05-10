resource "azurerm_storage_account" "storage_name_for_env" {
  count = var.env == "dev" ? 1 : var.stor_acc_count
  name                     = "${ var.env == "qa" ? format("%s%s", local.stor_qa_name, count.index) : (var.env == "dev" ? local.stor_dev_name : local.stor_acc_name) }"
  location                 = var.env == "dev" ? var.location : var.apc_kv_stor_account_pair_locations[count.index]
  resource_group_name      = azurerm_resource_group.rg_apc_kv.name
  account_tier             = var.sku_name
  account_replication_type = "LRS"

  tags = local.common_tags
}


resource "azurerm_storage_account" "storage_name_for_env_pair" {
  provider = azurerm.provider2
  count    = "${ var.env == "qa" && var.stor_acc_count >= 1 ? var.stor_acc_count : 0 }"
  name                     = "${ var.env == "qa" ? format("%sp%s", local.stor_qa_name, count.index) : (var.env == "dev" ? local.stor_dev_name : local.stor_acc_name) }"
  location                 = var.stor_acc_count == 1 ? var.apc_kv_stor_account_pair_locations[count.index + 1] : var.apc_kv_stor_account_pair_locations[count.index]
  resource_group_name      = azurerm_resource_group.rg_apc_kv.name
  account_tier             = var.sku_name
  account_replication_type = "LRS"

  tags = local.common_tags
}

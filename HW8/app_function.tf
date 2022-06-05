data "azurerm_storage_account" "st_acc" {
  for_each = var.stor_acc_count
  name = azurerm_storage_account.storage_name_for_env[each.key].name
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
}

module "create_app_function" {
  source                     = "./modules/app_function"
  rg_name                    = azurerm_resource_group.rg_apc_kv.name
  region                     = azurerm_resource_group.rg_apc_kv.location
  
  appfunction_plan_name      = "plan-appfunc-${local.correct_full_name}-${var.env}"
  app_function_plan_os_type  = "Windows"
  app_function_plan_sku_name = "Y1"
  
  app_function_name          = "func-${local.correct_full_name}-${var.env}"
  stor_acc_count             = var.stor_acc_count
  storage_account            = data.azurerm_storage_account.st_acc
  # original_is_work =  storage_account            = azurerm_storage_account.storage_name_for_env

  resource_tags = local.common_tags
}

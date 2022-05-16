module "create_app_function" {
  source                     = "./modules/app_function"
  rg_name                    = azurerm_resource_group.rg_apc_kv.name
  region                     = azurerm_resource_group.rg_apc_kv.location
  appfunction_plan_name      = "plan-appfunc-${local.correct_full_name}-${var.env}"
  app_function_plan_os_type  = "Windows"
  app_function_plan_sku_name = "Y1"
  app_function_name          = "func-${local.correct_full_name}-${var.env}"
  stor_acc_count             = var.stor_acc_count
  storage_account            = azurerm_storage_account.storage_name_for_env
}

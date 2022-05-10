# data "azurerm_storage_account" "storage_primary_key_for_function_app" {
#   name                = azurerm_storage_account.storage_name_for_env[*].name
#   resource_group_name = azurerm_resource_group.rg_apc_kv.name
# }

resource "azurerm_app_service_plan" "app_function_plan" {
  name                = "plan-appfunc-${local.correct_full_name}-${var.env}"
  location            = azurerm_resource_group.rg_apc_kv.location
  resource_group_name = azurerm_resource_group.rg_apc_kv.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "app_function" {
#   count = var.stor_acc_count
  name                       = "func-${local.correct_full_name}-${var.env}"
  location                   = azurerm_resource_group.rg_apc_kv.location
  resource_group_name        = azurerm_resource_group.rg_apc_kv.name
  app_service_plan_id        = azurerm_app_service_plan.app_function_plan.id
#   storage_account_name       = azurerm_storage_account.storage_name_for_env[count.index].name
#   storage_account_access_key = azurerm_storage_account.storage_name_for_env[count.index].primary_access_key
}

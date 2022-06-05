resource "azurerm_service_plan" "app_function_plan" {
  name                = var.appfunction_plan_name
  resource_group_name = var.rg_name
  location            = var.region
  os_type             = var.app_function_plan_os_type
  sku_name            = var.app_function_plan_sku_name

  tags = var.resource_tags
}

resource "azurerm_windows_function_app" "app_function" {
  for_each            = var.stor_acc_count
  name                = "${var.app_function_name}-${each.value["name"]}"
  resource_group_name = var.rg_name
  # location            = each.value["region"] - не работает спросить про план и апп функцию про регион что сощлдается апп функция только для плана в регионе плана
  location            = var.region

  storage_account_name       = var.storage_account[each.key].name
  storage_account_access_key = var.storage_account[each.key].primary_access_key
  service_plan_id            = azurerm_service_plan.app_function_plan.id

  site_config {}
  
  tags = var.resource_tags

  lifecycle {
    ignore_changes = [ tags ]
  }
}

output "app_fuction_plan_id" {
  value = azurerm_service_plan.app_function_plan.id
}

output "app_functions_name_location" {
  value = { for app_func in azurerm_windows_function_app.app_function: app_func.name => app_func.location }
}

output "app_functions_ids" {
  value = { for app_func in azurerm_windows_function_app.app_function: app_func.name => app_func.id }
}

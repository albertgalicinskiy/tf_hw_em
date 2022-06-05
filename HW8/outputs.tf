output "resource_group_id" {
  value = azurerm_resource_group.rg_apc_kv.id
}

output "storage_accounts_name_location" {
  value =  {for st_acc in azurerm_storage_account.storage_name_for_env: st_acc.name => st_acc.location }
}

output "storage_accounts_ids" {
  value =  { for st_acc in azurerm_storage_account.storage_name_for_env: st_acc.name => st_acc.id }
}

output "key_vaults_name_location" {
  value =  { for k_vault in azurerm_key_vault.key_vault: k_vault.name => k_vault.location }
}

output "key_vaults_ids" {
  value =  { for k_vault in azurerm_key_vault.key_vault: k_vault.name => k_vault.id }
}

output "app_configurations_name_location" {
  value =  {for app_conf in azurerm_app_configuration.app_configuration: app_conf.name => app_conf.location }
}

output "app_configurations_name" {
  value =  [ for app_conf in azurerm_app_configuration.app_configuration: app_conf.name ]
}

output "app_configurations_ids" {
  value =  { for app_conf in azurerm_app_configuration.app_configuration: app_conf.name => app_conf.id }
}


###### Outputs from modules ####

### app_finction module outputs
output "app_fuction_plan_id" {
  value = module.create_app_function.app_fuction_plan_id
}

output "app_fuctions_name_location" {
  value = module.create_app_function.app_functions_name_location
}

output "app_fuctions_ids" {
  value = module.create_app_function.app_functions_ids
}

### mssqlsrv_mssqldb_dbfw_rule module outputs
output "mssql_srv_id" {
  value = module.mssqlsrv_db_fw_rules.mssql_srv_id
}

output "mssql_db_id" {
  value = module.mssqlsrv_db_fw_rules.mssql_db_id
}

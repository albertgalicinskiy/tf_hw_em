data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  for_each                   = var.key_vault_count
  name                       = "kv-${local.resource_name_prefix}${var.env}-${each.value["name"]}"
  location                   = each.value["region"]
  resource_group_name        = azurerm_resource_group.rg_apc_kv.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = false
  soft_delete_retention_days = 7
  sku_name                   = var.sku_name
  tags                       = local.common_tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List",
    ]

    storage_permissions = [
      "Get",
      "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "secret_for_mssql_srv" {
  for_each     = var.key_vault_count
  name         = "mssql-srv-password-${each.value["name"]}"
  value        = random_password.random_password_sqlsrv.result
  key_vault_id = azurerm_key_vault.key_vault[each.key].id

  tags = local.common_tags
}

module "mssqlsrv_db_fw_rules" {
  source  = "./modules/mssqlsrv_mssqldb_dbfw_rule"
  rg_name = azurerm_resource_group.rg_apc_kv.name
  region  = azurerm_resource_group.rg_apc_kv.location

  mssql_srv_name     = "sqls-${local.correct_full_name}-${var.env}"
  mssql_srv_version  = "12.0"
  sql_admin_name     = "azuredbuser"
  sql_admin_password = random_password.random_password_sqlsrv.result

  mssql_db_name     = "sqld-${local.correct_full_name}-${var.env}"
  mssql_db_sku_name = "S0"

  mssql_fw_rule_name     = "AllowHostToDB-1"
  mssql_fw_rule_start_ip = "10.10.1.25"
  mssql_fw_rule_end_ip   = "10.10.1.25"

  resource_tags = local.common_tags
}

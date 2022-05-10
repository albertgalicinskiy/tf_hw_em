data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  count = var.env == "dev" ? 1 : var.key_vault_count
  name                       = "${ var.env == "qa" ? format("%s%s", local.key_vault_qa_name, count.index) : (var.env == "dev" ? local.key_vault_dev_name : local.key_vault_name) }"
  location                   = var.env == "dev" ? var.location : var.apc_kv_stor_account_pair_locations[count.index]
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
      "Get",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "List"

    ]

    storage_permissions = [
      "Get",
    ]

  }
}

resource "azurerm_key_vault" "key_vault_pair" {
  provider = azurerm.provider2
  count    = "${ var.env == "qa" && var.key_vault_count >= 1 ? var.key_vault_count : 0 }"
  name                       = "${ var.env == "qa" ? format("%sp%s", local.key_vault_qa_name, count.index) : (var.env == "dev" ? local.key_vault_dev_name : local.key_vault_name) }"
  location                   = var.key_vault_count == 1 ? var.apc_kv_stor_account_pair_locations[count.index + 1] : var.apc_kv_stor_account_pair_locations[count.index]
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
      "Get",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]

    storage_permissions = [
      "Get",
      "Set",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]

  }
}


resource "azurerm_key_vault_secret" "pass_for_mssql_srv" {
  name = "SQLPassword"
  value = random_password.random_password_sqlsrv.result
  key_vault_id = azurerm_key_vault.key_vault[0].id
}

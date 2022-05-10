data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  for_each = var.key_vault_count
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
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]

  }
}

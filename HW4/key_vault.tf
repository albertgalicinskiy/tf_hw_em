data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                       = local.kv_name
  location                   = var.location
  resource_group_name        = local.rg_name
  tenant_id                  = local.tenant_id
  purge_protection_enabled   = false
  soft_delete_retention_days = 7
  
  provider = azurerm.provider2
  sku_name = var.sku_name

  access_policy {
      tenant_id = local.tenant_id
      object_id = local.object_id

      key_permissions     = [
          "Get",
      ]

      secret_permissions  = [
          "Get",
      ]

      storage_permissions = [
          "Get",
      ]
      
  }

  tags       = local.common_tags

  depends_on = [
    azurerm_resource_group.rg_apc_kv
  ]
}

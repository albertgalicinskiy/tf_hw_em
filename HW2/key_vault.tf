data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name = "kv-albert-galitsinskiy"
  location = azurerm_resource_group.rg_apc_kv.location
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = false
  soft_delete_retention_days = 7
  
  provider = azurerm.provider2
  sku_name = "standard"

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

  tags = {
    "name_surname" = "Albert_Galitsinskiy"
  }

  depends_on = [
    azurerm_resource_group.rg_apc_kv
  ]
}

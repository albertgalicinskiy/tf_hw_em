locals {

  rg_name  = "rg-${var.user_name}-${var.user_surename}-${var.env}"
  kv_name  = "kv-${var.user_name}-${var.user_surename}-${var.env}"
  apc_name = "apc-${var.user_name}-${var.user_surename}-${var.env}"
  
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  # Tags for all resources
  common_tags = {
    "name_surname" = "${var.user_name}-${var.user_surename}"
    "Environment"  = var.env
  }
}

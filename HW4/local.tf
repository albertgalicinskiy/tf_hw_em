locals {

  correct_username = var.name_surename == regexall("_", var.name_surename) ? var.name_surename : replace(var.name_surename, "_", "")

  # rg_name        = "rg-${var.name_surename == regexall("_", var.name_surename) ? var.name_surename : replace(var.name_surename, "_", "")}-${var.env}"
  rg_name        = "rg-${local.correct_username}-${var.env}"
  kv_name        = "kv-${local.correct_username}-${var.env}"
  apc_name       = "apc-${local.correct_username}-${var.env}"
  storage_name   = "st${local.correct_username}${var.env}"
  
  tenant_id      = data.azurerm_client_config.current.tenant_id
  object_id      = data.azurerm_client_config.current.object_id

  # Tags for all resources
  common_tags = {
    "name_surname" = "${local.correct_username}"
    "Environment"  = var.env
  }
}

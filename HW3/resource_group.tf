#-----------------------------------------------------------------------
# Resource group
#-----------------------------------------------------------------------
resource "azurerm_resource_group" "rg_apc_kv" {
  name     = local.rg_name
  location = var.location

  tags     = local.common_tags
}
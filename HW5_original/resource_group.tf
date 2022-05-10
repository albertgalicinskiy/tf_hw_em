#-----------------------------------------------------------------------
# Resource group
#-----------------------------------------------------------------------
resource "azurerm_resource_group" "rg_apc_kv" {
  name     = "rg-${local.correct_full_name}-${var.env}"
  location = var.location

  tags = local.common_tags
}
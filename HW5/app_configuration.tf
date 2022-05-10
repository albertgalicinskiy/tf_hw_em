##resource "azurerm_app_configuration" "app_configuration_1" {
  # count = length(var.apc_kv_stor_account_locations)
  # location            = element(var.apc_kv_stor_account_locations, count.index)
  
  # 2 resource in 2 regions 
  
  #### wor 1 resource per region ######
  ##for_each = var.env == "dev" ? toset(var.apc_kv_stor_account_pair_locations) : toset([ var.location ])
  ##name                = var.env == "dev" ? "apc-${local.correct_full_name}${var.env}-pair-${each.key}" : "apc-${local.correct_full_name}-${var.env}"
  # for_each = toset(var.apc_kv_stor_account_locations)
  ####                          #######
  
  # count = var.webapp_dev_count
  # name = "apc-${local.correct_full_name}-${count.index + 1}-pair-${var.env}"
  # location            = var.apc_kv_stor_account_pair_locations[count.index] # [for location in var.apc_kv_stor_account_pair_locations: location.id]
  ##location = each.key
  ##resource_group_name = azurerm_resource_group.rg_apc_kv.name
  ##sku                 = var.sku_name

  ##tags = local.common_tags
##}

resource "azurerm_app_configuration" "app_configuration" {
  count = var.env == "qa" ? 1 : var.webapp_count
  name  = var.env == "qa" ? "apc-${local.correct_full_name}-${var.env}" : "apc-${local.correct_full_name}-${var.env}-${count.index}"
  ### if env = qa 1 resource per region 
  # location            = var.apc_kv_stor_account_pair_locations[count.index] # [for location in var.apc_kv_stor_account_pair_locations: location.id]
  ### if env = qa 1 resource in one region
  location            = var.env == "qa" ? var.location : var.apc_kv_stor_account_pair_locations[count.index] # [for location in var.apc_kv_stor_account_pair_locations: location.id]
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  sku                 = var.sku_name

  tags = local.common_tags
}

resource "azurerm_app_configuration" "app_configuration_pair" {
  provider = azurerm.provider2
  count    = "${ var.env == "dev" && var.webapp_count >= 1 ? var.webapp_count : 0 }"
  name                = "apc-${local.correct_full_name}-${var.env}-pair-${count.index}"
  location            = var.webapp_count == 1 ? var.apc_kv_stor_account_pair_locations[count.index + 1] : var.apc_kv_stor_account_pair_locations[count.index] # [for location in var.apc_kv_stor_account_pair_locations: location.id]
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  sku                 = var.sku_name

  tags = local.common_tags
}

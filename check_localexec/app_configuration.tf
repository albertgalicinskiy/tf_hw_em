resource "azurerm_app_configuration" "app_configuration" {
  for_each            = var.webapp_count
  name                = "apc-${local.correct_full_name}-${var.env}-${each.value["name"]}"
  location            = each.value["region"]
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  sku                 = var.appconf_sku_name

  tags = local.common_tags

  provisioner "local-exec" {
    command = "key_value_app_config.sh ${self.name}"
  }
}

# locals {
#   appCfgName = azurerm_app_configuration.app_configuration
# }

# resource "null_resource" "key_value_app_config" {
#   for_each = var.webapp_count
#   depends_on = [ azurerm_app_configuration.app_configuration ]
#   provisioner "local-exec" {
#     command = "./key_value_app_config.sh 1" # ${azurerm_app_configuration.app_configuration[each.key].name}"
#     # environment = {
#     #   appConfName = local.appCfgName[each.key].name
#     #  }
#   }
# }
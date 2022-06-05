resource "azurerm_app_configuration" "app_configuration" {
  for_each            = var.webapp_count
  name                = "apc-${local.correct_full_name}-${var.env}-${each.value["name"]}"
  location            = each.value["region"]
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  sku                 = var.appconf_sku_name

  tags = local.common_tags

provisioner "local-exec" {
    command = "key_value_app_config.sh ${self.name} ${var.user_name} ${var.user_surename}"
  }
}

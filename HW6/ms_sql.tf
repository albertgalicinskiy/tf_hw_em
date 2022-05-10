resource "azurerm_mssql_server" "ms_sql_server" {
  name = "sqls-${local.correct_full_name}-${var.env}"
  location = azurerm_resource_group.rg_apc_kv.location
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  administrator_login = "azureuser"
  administrator_login_password = random_password.random_password_sqlsrv.result
  version = "12.0"
}

resource "azurerm_mssql_database" "ms_sql_db" {
  name = "sqld-${local.correct_full_name}-${var.env}"
  server_id = azurerm_mssql_server.ms_sql_server.id
  sku_name = "S0"
}

resource "azurerm_sql_firewall_rule" "acces_to_sqlsrv" {
  name = "AllowForSubnet"
  resource_group_name = azurerm_resource_group.rg_apc_kv.name
  server_name = azurerm_mssql_server.ms_sql_server.name
  start_ip_address = "10.10.1.1"
  end_ip_address = "10.10.1.254"
}

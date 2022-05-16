resource "azurerm_mssql_server" "ms_sql_server" {
  name                         = var.mssql_srv_name
  resource_group_name          = var.rg_name
  version                      = var.mssql_srv_version
  location                     = var.region
  administrator_login          = var.sql_admin_name
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "ms_sql_db" {
  name      = var.mssql_db_name
  server_id = azurerm_mssql_server.ms_sql_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = var.mssql_db_sku_name
}

resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  name      = var.mssql_fw_rule_name
  server_id = azurerm_mssql_server.ms_sql_server.id
  # fake IP
  start_ip_address = var.mssql_fw_rule_start_ip
  end_ip_address   = var.mssql_fw_rule_end_ip
}

output "mssql_srv_id" {
  value = azurerm_mssql_server.ms_sql_server.id
}

output "mssql_db_id" {
  value = azurerm_mssql_database.ms_sql_db.id
}

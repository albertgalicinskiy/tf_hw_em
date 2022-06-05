output "resource_group_id" {
  value = azurerm_resource_group.terraform_tfstate_hw4.id
}

output "storage_account_id" {
  value = azurerm_storage_account.hw4tftfstate.id
}

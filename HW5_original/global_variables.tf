variable "name_surename" {
  type        = string
  description = "username_surename: "
}

variable "location" {
  type        = string
  default     = "eastasia"
  description = "Region for resource group: "
}

variable "apc_kv_stor_account_pair_locations" {
  type        = list(string)
  description = "Region for paired resources (kv, apc, stor_account): "
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "env" {
  type        = string
  description = "Environment name: "
}

variable "webapp_count" {
  type = number
  description = "Count of Web App in env: "
  default = 1
}

variable "stor_acc_count" {
  type = number
  description = "Count of Storage Account in env: "
  default = 1
}

variable "key_vault_count" {
  type = number
  description = "Count of Key Vault in env: "
  default = 1
}

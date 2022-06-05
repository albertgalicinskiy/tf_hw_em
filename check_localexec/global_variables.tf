variable "name_surename" {
  type        = string
  description = "username_surename: "
}

variable "location" {
  type        = string
  default     = "eastasia"
  description = "Region for resource group: "
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "appconf_sku_name" {
  type    = string
  default = "free"
}

variable "storage_sku_name" {
  type    = string
  default = "Standard"
}


variable "env" {
  type        = string
  description = "Environment name: "
}

variable "webapp_count" {
  type = map(object({
    name   = string
    region = string
  }))
  default = {
    "first_app" = {
      name   = "app1"
      region = "eastasia"
    }
  }
}

variable "stor_acc_count" {
  type = map(object({
    name   = string
    region = string
  }))
  default = {
    "first_app" = {
      name   = "app1"
      region = "eastasia"
    }
  }
}

variable "key_vault_count" {
  type = map(object({
    name   = string
    region = string
  }))
  default = {
    "first_app" = {
      name   = "app1"
      region = "eastasia"
    }
  }
}

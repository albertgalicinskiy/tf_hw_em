variable "name_surename" {
  type        = string
  default     = "albert_galitsin"
  description = "Enter a username_surename: "
}

variable "location" {
  type        = string
  default     = "East Asia"
  description = "Enter loaction for resources: "
}

variable "sku_name" {
    type    = string
    default = "standard"
}

variable "env" {
    type        = string
    description = "Enter name of envorinment: "
}

variable "user_name" {
  type        = string
  default     = "albert"
  description = "Enter a username: "
}

variable "user_surename" {
  type        = string
  default     = "galitsin"
  description = "Enter a surname: "
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

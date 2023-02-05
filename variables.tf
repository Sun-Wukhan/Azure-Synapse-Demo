locals {
  common_tags = {
    Environment = var.env
    Billing = "Billing"
    Program = "Program"
  }
}

variable "env" {
  type    = string
  default = "dev"
}

variable "sql_user" {
  type    = string
  default = "cn02d"
}

variable "sql_password" {
  type    = string
  description = "SQL Password"
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "sku_tier" {
  type = map(any)
  default = {
    "cn02d" = "Basic"
  }
}

variable "sku_size" {
  type = map(any)
  default = {
    "cn02d" = "B1"
  }
}

variable "sku_capacity" {
  type = map(any)
  default = {
    "cn02d" = 1
  }
}

variable "kv_url" {
  type = map(any)
  default = {
    "cn02d" = "https://navid-dev-kvdev001.vault.azure.net"
    "cn02q" = "https://navid-qa-kvqa001.vault.azure.net"
    "cn02u" = "https://navid-uat.vault.azure.net"
    "cn02p" = "https://navid-prod.vault.azure.net"
  }
  
}

variable "addrs" {
  type = string
  default = "10.212.160.0/20"
}
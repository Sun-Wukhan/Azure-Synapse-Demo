terraform {
   backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Navid-Org"

    workspaces {
      prefix = "synapse-"
    }
  }
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
 skip_provider_registration = true
}

data "azurerm_client_config" "current" {

}

data "azurerm_subscription" "primary" {
}

resource "azurerm_resource_group" "this" {
  name     = "${var.env}-RGSynapse${var.env}01-tf"
  location = "${var.location}"
  tags = local.common_tags
}

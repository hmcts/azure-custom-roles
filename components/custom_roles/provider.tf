terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
terraform {
  backend "azurerm" {
    resource_group_name  = "adel2-rg"
    storage_account_name = "adel2mytfstate"
    container_name       = "adel-tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing_rg" {
  name = "Chahat_Mittal_RG"
}

# Create Storage Account in existing RG

resource "azurerm_storage_account" "storage1" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.existing_rg.name
  location                 = data.azurerm_resource_group.existing_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = []
  }
}


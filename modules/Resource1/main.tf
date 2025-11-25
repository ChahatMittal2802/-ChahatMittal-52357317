
provider "azurerm" {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing_rg" {
  name = "Chahat_Mittal_RG"
}

# Create Storage Account in existing RG
resource "azurerm_storage_account" "storage1" {
  name                     = "storageacctresource1"
  resource_group_name      = data.azurerm_resource_group.existing_rg.name
  location                 = data.azurerm_resource_group.existing_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

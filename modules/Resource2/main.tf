
provider "azurerm" {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing_rg" {
  name = "Chahat_Mittal_RG"
}

# Create Virtual Network in existing RG
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-resource2"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

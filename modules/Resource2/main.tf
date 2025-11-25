
provider "azurerm" {
  features {}
}

# Fetch details of the existing Resource Group
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]  # ✅ Correct list syntax
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}

# Create Subnet inside the VNet
resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]  # ✅ Correct list syntax

  # ✅ Disable default outbound access
  default_outbound_access_enabled = false
}

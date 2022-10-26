# Azure provider source and version being used
terraform {
  required_providers { 
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.28.0"
    }
  }
}

# configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}

# Create a resource group
resource "azurerm_resource_group" "testrg" {
  name = "test.rg"
  location = "US Central"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "testvnet" {
  name = "vnet1"
  resource_group_name = azurerm_resource_group.testrg.name
  location = azurerm_resource_group.testrg.location
  address_space = [ "10.0.0.0/16" ]
}

resource "azurerm_subnet" "testsnet" {
    name = "snet1"
    resource_group_name = azurerm_resource_group.testrg.name
    virtual_network_name = azurerm_virtual_network.testvnet.name
    address_prefixes = [ "10.0.1.0/24" ]
}

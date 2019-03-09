# Specify the provider and access details
provider "azurerm" {
  version = "=1.22.0"
}


# Create a resource group
resource "azurerm_resource_group" "ocpdev01" {
  name     = "${var.rgroup}"
  location = "${var.location}"
}


# Create a resource groug for template
resource "azurerm_resource_group" "ocpdev01image" {
  name     = "${var.rgrouptemplate}"
  location = "${var.location}"
}



# Create a virtual network within the resource group
resource "azurerm_virtual_network" "ocpdev01" {
  name                = "ocpvnet"
  resource_group_name = "${azurerm_resource_group.ocpdev01.name}"
  location            = "${azurerm_resource_group.ocpdev01.location}"
  address_space       = ["172.0.0.0/16"]

}

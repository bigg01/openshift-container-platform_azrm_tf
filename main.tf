# Specify the provider and access details
provider "azurerm" {
  version = "=1.22.0"
}

# RMG-SDX6100001
# Create a resource group
resource "azurerm_resource_group" "ocpdev01" {
  name     = "${var.rgroup}"
  location = "${var.location}"
}

# RMG-SDX6100000
# Create a resource groug for template
resource "azurerm_resource_group" "ocpdev01image" {
  name     = "${var.rgrouptemplate}"
  location = "${var.location}"
}

# RMG-SDX6100002
# Create a resource groug for template
resource "azurerm_resource_group" "ocptst01" {
  name     = "RMG-SDX6100002"
  location = "${var.location}"
}



# RMG-SDX1100000
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "ocpdev01" {
  name                = "ocpvnet"
  resource_group_name = "${azurerm_resource_group.ocpdev01image.name}"
  location            = "${var.location}"
  address_space       = ["172.17.0.0/16"]

}

# SUB-SDX61fa000 172.17.80.0/22 OpenShift DEV Mgmt
resource "azurerm_subnet" "SUB-SDX61fa000" {
  name                 = "SUB-SDX61fa000"
  resource_group_name  = "${azurerm_resource_group.ocpdev01image.name}"
  virtual_network_name = "${azurerm_virtual_network.ocpdev01.name}"
  address_prefix       = "172.17.80.0/22"
}

# SUB-SDX61fb000 172.17.84.0/22 OpenShift DEV App
resource "azurerm_subnet" "SUB-SDX61fb000" {
  name                 = "SUB-SDX61fb000"
  resource_group_name  = "${azurerm_resource_group.ocpdev01image.name}"
  virtual_network_name = "${azurerm_virtual_network.ocpdev01.name}"
  address_prefix       = "172.17.84.0/22"
}

# SUB-SDX61fd000 172.17.92.0/22 OpenShift TST App
resource "azurerm_subnet" "SUB-SDX61fd000" {
  name                 = "SUB-SDX61fd000"
  resource_group_name  = "${azurerm_resource_group.ocpdev01image.name}"
  virtual_network_name = "${azurerm_virtual_network.ocpdev01.name}"
  address_prefix       = "172.17.92.0/22"
}

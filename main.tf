# Specify the provider and access details
provider "azurerm" {
  version = "=1.22.0"
}


# Create a resource group
resource "azurerm_resource_group" "test" {
  name     = "dev"
  location = "${var.location}"
}

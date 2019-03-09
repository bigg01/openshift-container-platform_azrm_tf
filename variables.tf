variable "cloud_provider" {
  description = "choose provider: azurerm, aws, etc"
  default     = "azurerm"
}

variable "location" {
  default     = "West Europe"
}


variable "rgroup" {
  description = "resource group"
  default     = "RMG-SDX6100001"
}

variable "rgrouptemplate" {
  description = "resource group for vm image and storage"
  default     = "RMG-SDX6100000"
}


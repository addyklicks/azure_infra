variable "vnet_name" {
  description = "The name of the VNet where the firewall will be deployed"
  type        = string
}

variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

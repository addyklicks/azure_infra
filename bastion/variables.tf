variable "vnet_name" {
  description = "The name of the VNet where Bastion will be deployed"
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

variable "public_ip_id" {
  description = "The ID of the public IP for the Bastion Host"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the Bastion Host"
  type        = string
}

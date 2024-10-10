variable "name" {
  description = "The name of the virtual network"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VNet"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "subnets" {
  description = "Map of subnets"
  type = map(object({
    name = string
    cidr = string
  }))
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR block for the VNet"
  type        = string
}

variable "subnets" {
  description = "Subnets within the VNet"
  type        = map(object({
    name = string
    cidr = string
  }))
}

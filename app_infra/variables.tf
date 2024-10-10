variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the Application Gateway will be deployed"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP for the Application Gateway"
  type        = string
}

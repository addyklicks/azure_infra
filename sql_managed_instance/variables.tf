variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the SQL Managed Instance will be deployed"
  type        = string
}

variable "admin_login" {
  description = "SQL Managed Instance admin username"
  type        = string
}

variable "admin_password" {
  description = "SQL Managed Instance admin password"
  type        = string
}

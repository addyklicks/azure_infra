variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "location" {
  description = "The Azure region where the VM will be created"
  type        = string
}

variable "resource_group" {
  description = "The resource group in which to create the virtual machine"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the VM's network interface will be created"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine (e.g., Standard_DS1_v2)"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

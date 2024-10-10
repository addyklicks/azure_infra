output "vm_id" {
  description = "The ID of the created Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.windows_vm.id
}

output "public_ip" {
  description = "The public IP address of the Windows VM"
  value       = azurerm_public_ip.windows_vm_public_ip.ip_address
}

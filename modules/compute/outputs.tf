output "vm_id" {
  description = "The ID of the created VM"
  value       = azurerm_windows_virtual_machine.this.id
}

output "nic_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}

output "public_ip" {
  description = "The public IP address (if created)"
  value       = var.public_ip ? azurerm_public_ip.this[0].ip_address : null
}

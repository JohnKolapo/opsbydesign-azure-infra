# modules/nsg/outputs.tf

output "nsg_ids" {
  description = "IDs of all created Network Security Groups"
  value = {
    for nsg_name, nsg in azurerm_network_security_group.this :
    nsg_name => nsg.id
  }
}

output "nsg_names" {
  description = "Names of all created Network Security Groups"
  value       = keys(azurerm_network_security_group.this)
}

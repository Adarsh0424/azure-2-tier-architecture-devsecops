output "nic_nsg_associations" {
  description = "Outputs of created network interface security group associations"
  value       = azurerm_network_interface_security_group_association.nic_nsg_assoc
}

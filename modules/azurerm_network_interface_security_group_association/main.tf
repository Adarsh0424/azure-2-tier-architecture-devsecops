resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  for_each                  = var.nic_nsg_associations
  network_interface_id      = var.network_interfaces[each.value.nic_key].id
  network_security_group_id = var.nsgs[each.value.nsg_key].id
}

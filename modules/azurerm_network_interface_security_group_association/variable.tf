variable "nic_nsg_associations" {
  description = "Map of NIC to NSG associations"
  type = map(object({
    nic_key = string
    nsg_key = string
  }))
}

variable "network_interfaces" {
  description = "Map of created network interfaces output from network_interfaces module"
  type        = any
}

variable "nsgs" {
  description = "Map of created network security groups output from nsgs module"
  type        = any
}

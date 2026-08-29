variable "vms" {
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = string
    nic_key                         = string
    disable_password_authentication = bool
    admin_username                  = string
    admin_password                  = string
    caching                         = string
    storage_account_type            = string
    publisher                       = string
    offer                           = string
    sku                             = string
    version                         = string
  }))
}

variable "network_interfaces" {
  description = "Map of created network interfaces"
  type        = any
}

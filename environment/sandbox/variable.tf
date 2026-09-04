variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "virtual_networks" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_interfaces" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    subnet_key                    = string
    private_ip_address_allocation = string
  }))
}

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
variable "nsgs" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    security_rule_name         = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "nic_nsg_associations" {
  type = map(object({
    nic_key = string
    nsg_key = string
  }))
}

variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}

variable "application_gateways" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku_name            = string
    sku_tier            = string
    sku_capacity        = number
    subnet_key          = string
    public_ip_key       = string
  }))
}

variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    sku_name                    = string
    enabled_for_disk_encryption = optional(bool, true)
    soft_delete_retention_days  = optional(number, 7)
    purge_protection_enabled    = optional(bool, false)
    rbac_authorization_enabled  = optional(bool, true)
  }))
}

variable "log_analytics_workspaces" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = optional(string, "PerGB2018")
    retention_in_days   = optional(number, 30)
  }))
}



variable "network_interfaces" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    subnet_key                    = string
    private_ip_address_allocation = string
  }))
}

variable "subnets" {
  description = "Map of created subnets output from the subnets module"
  type        = any
}

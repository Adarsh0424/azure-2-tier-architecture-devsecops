variable "application_gateways" {
  description = "Map of Application Gateway configurations"
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

variable "subnets" {
  description = "Map of created subnets output from subnets module"
  type        = any
}

variable "public_ips" {
  description = "Map of created public IPs output from public_ips module"
  type        = any
}

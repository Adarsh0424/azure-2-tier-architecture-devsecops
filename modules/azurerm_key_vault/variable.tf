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

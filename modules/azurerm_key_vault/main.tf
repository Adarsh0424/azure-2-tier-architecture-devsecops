data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each                    = var.key_vaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = each.value.sku_name
  enabled_for_disk_encryption = lookup(each.value, "enabled_for_disk_encryption", true)
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 7)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", false)
  rbac_authorization_enabled  = lookup(each.value, "rbac_authorization_enabled", true)
}

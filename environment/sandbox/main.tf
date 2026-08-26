module "resource_groups" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_networks" {
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
  depends_on       = [module.resource_groups]
}

module "subnets" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_networks]
}

module "network_interfaces" {
  source             = "../../modules/azurerm_network_interface"
  network_interfaces = var.network_interfaces
  subnets            = module.subnets.subnets
  depends_on         = [module.subnets]
}
module "vms" {
  source             = "../../modules/azurerm_virtual_machine"
  vms                = var.vms
  network_interfaces = module.network_interfaces.network_interfaces
  depends_on         = [module.network_interfaces]
}

module "nsgs" {
  source     = "../../modules/azurerm_network_secuirity_group"
  nsgs       = var.nsgs
  depends_on = [module.network_interfaces]
}

module "nic_nsg_associations" {
  source               = "../../modules/azurerm_network_interface_security_group_association"
  nic_nsg_associations = var.nic_nsg_associations
  network_interfaces   = module.network_interfaces.network_interfaces
  nsgs                 = module.nsgs.nsgs
  depends_on           = [module.network_interfaces, module.nsgs]
}

module "public_ips" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.resource_groups]
}

module "application_gateways" {
  source               = "../../modules/azurerm_application_gateway"
  application_gateways = var.application_gateways
  subnets              = module.subnets.subnets
  public_ips           = module.public_ips.public_ips
  depends_on           = [module.subnets, module.public_ips]
}


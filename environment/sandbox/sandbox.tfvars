resource_groups = {
  rg1 = {
    name     = "sandbox-rg"
    location = "centralindia"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "web-vnet"
    resource_group_name = "sandbox-rg"
    location            = "centralindia"
    address_space       = ["10.1.0.0/16"]
  }
  vnet2 = {
    name                = "db-vnet"
    resource_group_name = "sandbox-rg"
    location            = "centralindia"
    address_space       = ["10.2.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "web-subnet"
    resource_group_name  = "sandbox-rg"
    virtual_network_name = "web-vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet2 = {
    name                 = "db-subnet"
    resource_group_name  = "sandbox-rg"
    virtual_network_name = "db-vnet"
    address_prefixes     = ["10.2.1.0/24"]
  }
  subnet3 = {
    name                 = "app-subnet"
    resource_group_name  = "sandbox-rg"
    virtual_network_name = "web-vnet"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

network_interfaces = {
  nic1 = {
    name                          = "web-nic"
    location                      = "centralindia"
    resource_group_name           = "sandbox-rg"
    subnet_key                    = "subnet1"
    private_ip_address_allocation = "Dynamic"
  }
  nic2 = {
    name                          = "db-nic"
    location                      = "centralindia"
    resource_group_name           = "sandbox-rg"
    subnet_key                    = "subnet2"
    private_ip_address_allocation = "Dynamic"
  }
}

vms = {
  vm1 = {
    name                            = "sandbox-web-vm"
    resource_group_name             = "sandbox-rg"
    location                        = "centralindia"
    size                            = "Standard_B2s"
    nic_key                         = "nic1"
    disable_password_authentication = false
    admin_username                  = "azureadmin"
    admin_password                  = "admin@123456"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "ubuntu-24_04-lts"
    sku                             = "server"
    version                         = "latest"
  }
  vm2 = {
    name                            = "sandbox-db-vm"
    resource_group_name             = "sandbox-rg"
    location                        = "centralindia"
    size                            = "Standard_B2s"
    nic_key                         = "nic2"
    disable_password_authentication = false
    admin_username                  = "azureadmin"
    admin_password                  = "admin@123456"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "ubuntu-24_04-lts"
    sku                             = "server"
    version                         = "latest"
  }
}

nsgs = {
  nsg1 = {
    name                       = "sandbox-nsg"
    location                   = "centralindia"
    resource_group_name        = "sandbox-rg"
    security_rule_name         = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

nic_nsg_associations = {
  assoc1 = {
    nic_key = "nic1"
    nsg_key = "nsg1"
  }
  assoc2 = {
    nic_key = "nic2"
    nsg_key = "nsg1"

  }
}

public_ips = {
  pip1 = {
    name                = "sandbox-appgw-pip"
    resource_group_name = "sandbox-rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}
application_gateways = {
  appgw1 = {
    name                = "sandbox-appgw"
    resource_group_name = "sandbox-rg"
    location            = "centralindia"
    sku_name            = "Standard_v2"
    sku_tier            = "Standard_v2"
    sku_capacity        = 2
    subnet_key          = "subnet3"
    public_ip_key       = "pip1"
  }
}


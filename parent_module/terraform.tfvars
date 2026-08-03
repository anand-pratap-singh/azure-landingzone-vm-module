rg_name = {
  rg1 = {
    name     = "rg-dev-01"
    location = "westus"
  }

  rg2 = {
    name     = "rg-prod-01"
    location = "westus"
  }

   rg3 = {
    name     = "rg-prod-02"
    location = "westus"
  }
  
}

vnets = {
  vnet1 = {
    vnetname            = "vnet_dev_01"
    resource_group_name = "rg-dev-01"
    location            = "westus"
    address_space       = ["10.143.0.0/16"]

  }
}

subnets = {
  subnet1 = {
    name                 = "subnet_dev_01"
    virtual_network_name = "vnet_dev_01"
    resource_group_name  = "rg-dev-01"
    address_prefixes     = ["10.143.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet_dev_02"
    virtual_network_name = "vnet_dev_01"
    resource_group_name  = "rg-dev-01"
    address_prefixes     = ["10.143.2.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "frontend_vm_pip"
    resource_group_name = "rg-dev-01"
    location            = "westus"
    allocation_method   = "Dynamic"
  }
  pip2 = {
    name                = "backend_vm_pip"
    resource_group_name = "rg-dev-01"
    location            = "westus"
    allocation_method   = "Dynamic"
  }
}

vms = {
  vm1 = {
    nic_name                        = "frontedn_nic_01"
    location                        = "westus"
    resource_group_name             = "rg-dev-01"
    ip_configuration_name           = "internal1"
    private_ip_address_allocation   = "Dynamic"
    vm_name                         = "frontendvm"
    size                            = "Standard_D2_v3"
    admin_username                  = "Devopsadmin"
    admin_password                  = "Devops@admin"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    image_publisher                 = "Canonical"
    image_offer                     = "0001-com-ubuntu-server-jammy"
    image_sku                       = "22_04-lts"
    image_version                   = "latest"
    disable_password_authentication = false
    subnet_name                     = "subnet_dev_01"
    pip_name                        = "frontend_vm_pip"
    virtual_network_name            = "vnet_dev_01"
  }

  vm2 = {
    nic_name                        = "backend_nic_01"
    location                        = "westus"
    resource_group_name             = "rg-dev-01"
    ip_configuration_name           = "interna2"
    private_ip_address_allocation   = "Dynamic"
    vm_name                         = "backendvm"
    size                            = "Standard_D2_v3"
    admin_username                  = "Devopsadmin"
    admin_password                  = "Devops@admin"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    image_publisher                 = "Canonical"
    image_offer                     = "0001-com-ubuntu-server-jammy"
    image_sku                       = "22_04-lts"
    image_version                   = "latest"
    disable_password_authentication = false
    subnet_name                     = "subnet_dev_02"
    pip_name                        = "backend_vm_pip"
    virtual_network_name            = "vnet_dev_01"
  }
}

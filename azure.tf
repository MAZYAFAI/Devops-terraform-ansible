provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myresourcegroup" {
  name     = "my-rg"
  location = "East US"
}

resource "azurerm_virtual_machine" "myazureserver" {
  name                  = "my-azure-server"
  location              = azurerm_resource_group.myresourcegroup.location
  resource_group_name   = azurerm_resource_group.myresourcegroup.name
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "my-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "my-azure-server"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    Name   = "My Azure VM"
    env    = "Production"
    owner  = "Maz Yafai"
  }
}

resource "azurerm_public_ip" "main" {
  name                = "pip-${var.vm_name_affix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "main" {
  name                = "nic-${var.vm_name_affix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "ipconfig001"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = "vm-${var.vm_name_affix}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.vm_admin_username
  network_interface_ids = [azurerm_network_interface.main.id]

  custom_data = filebase64("${path.module}/user_data/${var.user_data_file}")

  identity {
    type = "SystemAssigned"
  }

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file(var.vm_public_key_path)
  }

  os_disk {
    name                 = "osdisk-${var.vm_name_affix}"
    caching              = "ReadOnly"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  dynamic "plan" {
    for_each = var.vm_plan
    iterator = plan

    content {
      name      = plan.value["name"]
      publisher = plan.value["publisher"]
      product   = plan.value["product"]
    }
  }

  lifecycle {
    ignore_changes = [custom_data]
  }
}
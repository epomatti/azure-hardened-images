terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.15.0"
    }
  }
}

locals {
  workload = "hardened"
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${local.workload}"
  location = var.location
}

module "network" {
  source              = "./modules/network"
  sys                 = local.workload
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allowed_public_ips  = var.allowed_public_ips
}

module "virtual_machine" {
  source              = "./modules/vm"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  vm_name_affix       = var.vm_name_affix
  vm_public_key_path  = var.vm_public_key_path
  vm_admin_username   = var.vm_admin_username
  vm_size             = var.vm_size
  user_data_file      = var.vm_user_data_file
  subnet_id           = module.network.default_subnet_id

  vm_image_publisher = var.vm_image_publisher
  vm_image_offer     = var.vm_image_offer
  vm_image_sku       = var.vm_image_sku
  vm_image_version   = var.vm_image_version

  vm_plan_name      = var.vm_plan_name
  vm_plan_publisher = var.vm_plan_publisher
  vm_plan_product   = var.vm_plan_product
}

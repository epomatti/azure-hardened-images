subscription_id    = ""
allowed_public_ips = [""]
location           = "brazilsouth"

vm_admin_username  = "azureuser"
vm_public_key_path = ".keys/tmp_rsa.pub"
vm_size            = "Standard_B2ls_v2"

### CIS Ubuntu Server LTS ###
# vm_user_data_file = "cis-ubuntu2404.sh"
# vm_name_affix     = "cis-ubuntu2404"

# vm_image_publisher = "center-for-internet-security-inc"
# vm_image_offer     = "cis-ubuntu"
# vm_image_sku       = "cis-ubuntulinux2404-l1-gen2"
# vm_image_version   = "1.0.1"

# # vm_plan_name      = "cis-ubuntulinux2404-l1-gen2"
# # vm_plan_publisher = "center-for-internet-security-inc"
# # vm_plan_product   = "cis-ubuntu"

# vm_plan = [
#   {
#     name      = "cis-ubuntulinux2404-l1-gen2"
#     product   = "center-for-internet-security-inc"
#     publisher = "cis-ubuntu"
#   }
# ]

### Canonical Ubuntu Pro ###
vm_user_data_file = "canonical-ubuntu-pro.sh"
vm_name_affix     = "canonical-ubuntu-pro"

vm_image_publisher = "canonical"
vm_image_offer     = "ubuntu-24_04-lts"
vm_image_sku       = "ubuntu-pro"
vm_image_version   = "latest"

# vm_plan_name      = null
# vm_plan_publisher = null
# vm_plan_product   = null

vm_plan = []

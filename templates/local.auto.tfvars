subscription_id    = ""
allowed_public_ips = [""]
location           = "brazilsouth"

vm_admin_username  = "azureuser"
vm_public_key_path = ".keys/tmp_rsa.pub"
vm_size            = "Standard_B2ls_v2"

### CIS Benchmark ###
vm_user_data_file = "cis-ubuntu2404.sh"
vm_name_affix     = "cis-ubuntu2404"

vm_image_publisher = "center-for-internet-security-inc"
vm_image_offer     = "cis-ubuntu"
vm_image_sku       = "cis-ubuntulinux2404-l1-gen2"
vm_image_version   = "latest"

vm_plan_name      = "cis-ubuntulinux2404-l1-gen2"
vm_plan_publisher = "center-for-internet-security-inc"
vm_plan_product   = "cis-ubuntu"

### Canonical Ubuntu ###
# vm_user_data_file  = "canonical-ubuntu.sh"
# vm_name_affix      = "canonical-ubuntu"
# 
# vm_image_publisher = "Canonical"
# vm_image_offer     = "ubuntu-24_04-lts"
# vm_image_sku       = "server"
# vm_image_version   = "latest"



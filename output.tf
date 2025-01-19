output "vm_ssh_command" {
  value = "ssh -i .keys/tmp_rsa ${var.vm_admin_username}@${module.virtual_machine.public_ip_address}"
}

output "storage_account_name" {
  value = module.storage.name
}

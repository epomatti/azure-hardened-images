variable "subscription_id" {
  type = string
}

variable "allowed_public_ips" {
  type = list(string)
}

variable "location" {
  type = string
}

variable "vm_admin_username" {
  type = string
}

variable "vm_public_key_path" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_name_affix" {
  type = string
}

variable "vm_user_data_file" {
  type = string
}

variable "vm_image_publisher" {
  type = string
}

variable "vm_image_offer" {
  type = string
}

variable "vm_image_sku" {
  type = string
}

variable "vm_image_version" {
  type = string
}

variable "vm_plan_name" {
  type = string
}

variable "vm_plan_publisher" {
  type = string
}

variable "vm_plan_product" {
  type = string
}

variable "sys" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "allowed_public_ips" {
  type = list(string)
}
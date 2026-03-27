variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {}
variable "nic_id" {}

variable "os_type" {
  description = "linux or windows"
}

variable "os_disk_size_gb" {
  default = 128
}

variable "data_disk_size_gb" {}

variable "custom_data" {
  default = null
}

output "web_vm_name" {
  value = azurerm_linux_virtual_machine.web_vm.name
}

output "db_vm_name" {
  value = azurerm_linux_virtual_machine.db_vm.name
}

output "web_public_ip" {
  value = azurerm_public_ip.web_pip.ip_address
}

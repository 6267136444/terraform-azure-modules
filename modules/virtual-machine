resource "azurerm_linux_virtual_machine" "linux_vm" {
  count = var.os_type == "linux" ? 1 : 0

  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [var.nic_id]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = var.custom_data
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count = var.os_type == "windows" ? 1 : 0

  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [var.nic_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_managed_disk" "data_disk" {
  name                 = "${var.vm_name}-data-disk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  disk_size_gb         = var.data_disk_size_gb
  create_option        = "Empty"
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  managed_disk_id = azurerm_managed_disk.data_disk.id

  virtual_machine_id = coalesce(
    try(azurerm_linux_virtual_machine.linux_vm[0].id, null),
    try(azurerm_windows_virtual_machine.windows_vm[0].id, null)
  )

  lun     = 0
  caching = "ReadWrite"
}

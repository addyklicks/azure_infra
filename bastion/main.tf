resource "azurerm_public_ip" "bastion_public_ip" {
  name                = "bastionPublicIP"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "myBastionHost"
  location            = var.location
  resource_group_name = var.resource_group
  virtual_network_id = var.vnet_name


  ip_configuration {
    name                 = "bastionIPConfig"
    public_ip_address_id = azurerm_public_ip.bastion_public_ip.id
    subnet_id            = var.subnet_id  # Ensure you pass a valid subnet for Bastion
  }

  depends_on = [azurerm_public_ip.bastion_public_ip]
}

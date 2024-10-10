resource "azurerm_virtual_network_gateway" "vnet_gateway" {
  name                = "myVNetGateway"
  location            = var.location
  resource_group_name = var.resource_group
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"
  enable_bgp          = false
  active_active       = false

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = var.public_ip_id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
}

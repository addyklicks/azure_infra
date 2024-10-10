resource "azurerm_firewall" "firewall" 
{
  name                = "myFirewall"
  location            = var.location
  resource_group_name = var.resource_group
  virtual_network_name = var.vnet_name

  sku {
    name = "WAF V2"
    tier = "Standard"
  }
}
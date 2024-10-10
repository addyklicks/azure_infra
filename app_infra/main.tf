resource "azurerm_public_ip" "app_gateway_public_ip" {
  name                = "appGatewayPublicIP"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "app_gateway" { #azure app gateway
  name                = "myAppGateway"
  location            = var.location
  resource_group_name = var.resource_group

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIPConfig"
    subnet_id = var.subnet_id  # Pass the correct subnet ID for the Application Gateway
  }

  frontend_ip_configuration {
    name                 = "frontendConfig"
    public_ip_address_id = azurerm_public_ip.app_gateway_public_ip.id
  }

  frontend_port {
    name = "frontendPort"
    port = 80
  }

  backend_address_pool {
    name = "backendPool"
    # Use IPs or FQDNs for the backend servers.
    backend_addresses {
      ip_address = "10.0.3.4"
    }
    backend_addresses {
      ip_address = "10.0.3.5"
    }
  }

  backend_http_settings {
    name                  = "httpSettings"
    cookie_based_affinity  = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20

    probe {
      name = "httpProbe"
    }
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontendConfig"
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routingRule"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backendPool"
    backend_http_settings_name = "httpSettings"
  }

  probe {
    name     = "httpProbe"
    protocol = "Http"
    path     = "/"
    interval = 30
    timeout  = 120
    unhealthy_threshold = 3
    pick_host_name_from_backend_http_settings = true
  }

  depends_on = [azurerm_public_ip.app_gateway_public_ip]
}
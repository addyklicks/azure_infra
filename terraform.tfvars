vnet_name = "my-vnet"
vnet_cidr = "10.0.0.0/16"

subnets = {
  firewall = {
    name = "firewall-subnet"
    cidr = "10.0.1.0/24"
  }
  app_gateway = {
    name = "app-gateway-subnet"
    cidr = "10.0.2.0/24"
  }
  backend = {
    name = "backend-subnet"
    cidr = "10.0.3.0/24"
  }
}

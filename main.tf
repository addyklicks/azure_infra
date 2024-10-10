module "vnet" {
  source = "./modules/vnet"
  name   = var.vnet_name
  cidr   = var.vnet_cidr
  subnets = var.subnets
}

module "firewall" {
  source = "./modules/firewall"
  vnet_name = module.vnet.name
}

module "application_gateway" {
  source = "./modules/app_gateway"
  vnet_name = module.vnet.name
}

module "virtual_machines" {
  source      = "./modules/windowsvm"
  vnet_name   = module.vnet.name
  subnet_name = module.vnet.subnets.backend
}

module "bastion" {
  source = "./modules/bastion"
  vnet_name = module.vnet.name
}

module "sql_managed_instance" {
  source = "./modules/sql_managed_instance"
  vnet_name = module.vnet.name
}

module "vnet_gateway" {
  source = "./modules/vnet_gateway"
  vnet_name = module.vnet.name
}
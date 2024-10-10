resource "azurerm_sql_managed_instance" "sql_instance" {
  name                = "mySQLInstance"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_id

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  sku_name                     = "GP_Gen5_4"
  storage_size_in_gb           = 32
  vcores                       = 4
}

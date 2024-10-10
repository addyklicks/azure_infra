# provider.tf
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

# Ensure you have a variable for the subscription_id
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

# Create a resource group
resource "azurerm_resource_group" "resource-group" {
  name     = "${var.rg-name}${var.rg-suffix}"
  location = var.rg-region

  tags = {
    environment = var.rg-tag
  }
}

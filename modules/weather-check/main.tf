# Create dataAPI app service
resource "azurerm_app_service" "weathercheck-appservice" {
  name                = "${var.wc-name}${var.wc-suffix}"
  location            = var.wc-region
  resource_group_name = var.wc-rg-name
  app_service_plan_id = azurerm_app_service_plan.weathercheck-appservice-plan.id

  site_config {}

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.wc-appl-insights
    "TestKey" = "TestText"   
  }

  # Set the tags for the dataAPI app service
  tags = {
    environment = var.wc-tag
  }
}

# Create dataAPI app service plan
resource "azurerm_app_service_plan" "weathercheck-appservice-plan" {
  name                = "${var.wc-asp-name}${var.wc-suffix}"
  location            = var.wc-region
  resource_group_name = var.wc-rg-name
  kind                = "Windows"

  sku {
    tier = "Standard"
    size = "S1"
  }

  # Set the tags for the dataAPI app service plan
  tags = {
    environment = var.wc-tag
  }
}

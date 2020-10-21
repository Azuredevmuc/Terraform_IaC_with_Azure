terraform {
  # It's recommended to pin the terraform sdk version
  required_version = "0.12.20"
  backend "azurerm" {
    resource_group_name  = "terraform_state"
    storage_account_name = "storage_account_name"
    container_name       = "terraform01"
    key                  = "tf/terraform.tfstate"
  }
}

#------------ Provider ---------------------
provider "azurerm" {
  # It's recommended to pin the version with a " = " before the version number
  version         = "=2.0.0"
  tenant_id       = var.tenantID
  subscription_id = var.subscriptionID

  features {}
}

#------------ Azure App Insights -----------
resource "azurerm_application_insights" "appinsights" {
  name                = "${"appinsights"}${var.suffix}"
  location            = module.terraform-demo-rg.resourceGroupRegion
  resource_group_name = module.terraform-demo-rg.resourceGroupName
  application_type    = "web"

  tags = {
    environment = var.tag
  }
}

#---- Resource Groups ----------------------

#------------ Default Resource Group -------
module "terraform-demo-rg" {
  source = "./modules/resource-group"

  rg-name   = "terraform-demo"
  rg-region = var.region
  rg-suffix = var.suffix
  rg-tag    = var.tag
}

#------------ Weathercheck App Service / -Plan -
module "weatherCheckAppService" {
  source = "./modules/weather-check"

  #---------- App Service Config -----------
  wc-name          = "terraform-demo"
  wc-rg-name       = module.terraform-demo-rg.resourceGroupName
  wc-region        = module.terraform-demo-rg.resourceGroupRegion
  wc-suffix        = var.suffix
  wc-tag           = var.tag
  wc-appl-insights = azurerm_application_insights.appinsights.instrumentation_key

  #---------- App Service Plan Config ------
  wc-asp-name = "terraform-demo-appservice-plan"
}

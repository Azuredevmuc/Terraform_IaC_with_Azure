variable "wc-name" {
  description = "The name of the weahter check app service"
  default     = "analytics-py-appservice"
}

variable "wc-asp-name" {
  description = "The name of the weahter check app service plan"
  default     = "analytics-py-appservice-plan"
}

variable "wc-region" {
  description = "The region of the weahter check app service /-plan"
  default     = "West Europe"
}

variable "wc-rg-name" {
  description = "The name of the resource group used in the weahter check app service /-plan"
}

variable "wc-suffix" {
  description = "The suffix of the weahter check app service /-plan"
}

variable "wc-tag" {
  description = "The tag of the app weahter check app service /-plan"
}

variable "wc-appl-insights" {
  description = "The instrumentation key used in the weahter check app service application settings"
}

variable "environment" {
  description = "The environment variable that specifies which environment is currently in use"
}

variable "region" {
  description = "Specific region which is used in different resources"
  default     = "West Europe"
}

variable "suffix" {
  description = "Specific suffix which is used in different resources"
}

variable "tag" {
  description = "Specific tag which is used in different resources"
}

variable "tenantID" {
  description = "The tenant id for the deployment"
  default     = ""
}

variable "subscriptionID" {
  description = "The subscription id for the deployment"
  default     = ""
}


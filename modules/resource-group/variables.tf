variable "rg-name" {
  description = "The name of the resourcegroup"
}

variable "rg-region" {
  description = "The region of the resourcegroup"
  default     = "West Europe"
}

variable "rg-suffix" {
  description = "The suffix of the resourcegroup"
  default     = ""
}

variable "rg-tag" {
  description = "The tag of the resource group"
}

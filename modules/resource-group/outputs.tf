output "resourceGroupName" {
  description = "The name of the resource group which is used in certain modules"
  value       = azurerm_resource_group.resource-group.name
}

output "resourceGroupRegion" {
  description = "The region of the resource group which is used in certain modules"
  value       = azurerm_resource_group.resource-group.location
}

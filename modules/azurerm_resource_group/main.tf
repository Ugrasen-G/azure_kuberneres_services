variable "rg-aks" {}

resource "azurerm_resource_group" "aks-rg" {
    for_each = var.rg-aks
  name     = each.value.name
  location = each.value.location
  managed_by = each.value.managed_by
  tags  = each.value.tags
}
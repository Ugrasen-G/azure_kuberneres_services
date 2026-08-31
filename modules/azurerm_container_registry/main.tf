variable "acr" {}

resource "azurerm_container_registry" "acr-kubernetes" {
for_each = var.acr
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = each.value.admin_enabled
}
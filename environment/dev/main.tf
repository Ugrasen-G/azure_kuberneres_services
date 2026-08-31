module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg-aks = var.rg-aks
}

module "azurerm_container_registry" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_container_registry"
  acr        = var.acr
}

module "azurerm_kubernetes_cluster" {
  depends_on = [module.azurerm_container_registry]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks        = var.aks

}
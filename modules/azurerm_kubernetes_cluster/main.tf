variable "aks" {}

resource "azurerm_kubernetes_cluster" "example" {
    for_each = var.aks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.pool_name
    node_count = each.value.node_count
    vm_size    = each.value.vm_size
  }
node_provisioning_profile {
    mode = "Manual"
}
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

# 

output "client_certificate" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.example :
    key => cluster.kube_config[0].client_certificate
  }

  sensitive = true
}

output "kube_config" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.example :
    key => cluster.kube_config_raw
  }

  sensitive = true
}

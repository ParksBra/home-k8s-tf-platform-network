variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
}

variable "azure_resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "azure_key_vault_name" {
  description = "The name of the Azure Key Vault"
  type        = string
}

variable "pod_network_cidr" {
  description = "The CIDR for the pod network"
  type        = string
}

variable "service_network_cidr" {
  description = "The CIDR for the service network"
  type        = string
}

variable "cluster_domain" {
  description = "The cluster domain (e.g., cluster.local)"
  type        = string
}



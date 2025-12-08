locals {
  # DNS configuration
  dns_records_default_comment = "Managed by Terraform"
}

locals {
  # Network configuration
  cert_manager_namespace = "cert-manager"

  tailscale_operator_namespace = "tailscale-operator"

  tigera_operator_namespace = "tigera-operator"

  ingress_nginx_namespace = "ingress-nginx"

  cert_manager_create_cluster_issuer = true
  cert_manager_cluster_issuer_name = "letsencrypt"
}

locals {
  platform_context_namespace = "platform-network"
  platform_context_configmap_name = "context"
}

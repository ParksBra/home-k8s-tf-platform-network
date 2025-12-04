locals {
  # DNS configuration
  external_domain = "parkl.ee"
  create_dns_records = true
  dns_ttl_seconds = 1 # 1 is Automatic TTL
  dns_records_proxy_enabled = false
  dns_records_default_comment = "Managed by Terraform"
}

locals {
  pod_network_cidr_var_ref = "home-k8s-cluster-pod-network-cidr"
  service_network_cidr_var_ref = "home-k8s-cluster-service-network-cidr"
  cluster_domain_var_ref = "home-k8s-cluster-cluster-domain"

  cert_manager_acme_email_var_ref = "home-k8s-cluster-certmanager-acme-email"
  cert_manager_dns_provider_email_var_ref = "home-k8s-cluster-certmanager-cloudflare-email"
  cert_manager_dns_provider_api_token_var_ref = "home-k8s-cluster-certmanager-cloudflare-api-token"

  tailscale_oauth_client_id_var_ref = "home-k8s-cluster-tailscale-operator-client-id"
  tailscale_oauth_client_secret_var_ref = "home-k8s-cluster-tailscale-operator-client-secret"
}

locals {
  # Network configuration
  pod_network_cidr = data.azuredevops_variable_group.library.variables[local.pod_network_cidr_var_ref]
  service_network_cidr = data.azuredevops_variable_group.library.variables[local.service_network_cidr_var_ref]
  cluster_domain = data.azuredevops_variable_group.library.variables[local.cluster_domain_var_ref]

  cert_manager_namespace = "cert-manager"

  tailscale_operator_namespace = "tailscale-operator"

  tigera_operator_namespace = "tigera-operator"

  ingress_nginx_namespace = "ingress-nginx"

  tailscale_oauth_client_id = data.azuredevops_variable_group.library.variables[local.tailscale_oauth_client_id_var_ref]
  tailscale_oauth_client_secret = data.azuredevops_variable_group.library.variables[local.tailscale_oauth_client_secret_var_ref]
  tailscale_operator_default_tags = [
    "tag:k8s-operator"
  ]
  tailscale_proxy_default_tags = [
    "tag:k8s"
  ]

  cert_manager_create_cluster_issuer = true
  cert_manager_cluster_issuer_name = "letsencrypt"
  cert_manager_acme_email = data.azuredevops_variable_group.library.variables[local.cert_manager_acme_email_var_ref]
  cert_manager_dns_provider = "cloudflare"
  cert_manager_dns_provider_email = data.azuredevops_variable_group.library.variables[local.cert_manager_dns_provider_email_var_ref]
  cert_manager_dns_provider_api_token = data.azuredevops_variable_group.library.variables[local.cert_manager_dns_provider_api_token_var_ref]
}

locals {
  platform_context_namespace = "platform-network"
  platform_context_configmap_name = "context"
}

locals {
  # DNS configuration
  external_parent_domain = "parkl.ee"
  create_dns_records = true
  dns_ttl_seconds = 1 # 1 is Automatic TTL
  dns_records_proxy_enabled = false
  dns_records_default_comment = "Managed by Terraform"
  cloudflare_provider_api_token_secret_name = "terraform-provider-cloudflare-api-token"
}

locals {
  # Network configuration
  pod_network_cidr = "10.244.0.0/16"
  pod_service_cidr = "10.96.0.0/12"
  cluster_domain = "cluster.local"

  cert_manager_namespace = "cert-manager"

  tailscale_operator_namespace = "tailscale-operator"

  tigera_operator_namespace = "tigera-operator"

  ingress_nginx_namespace = "ingress-nginx"

  tailscale_oauth_client_id_secret_name = "k8s-tailscale-operator-client-id"
  tailscale_oauth_client_secret_secret_name = "k8s-tailscale-operator-client-secret"

  tailscale_operator_default_tags = [
    "tag:k8s-operator"
  ]
  tailscale_proxy_default_tags = [
    "tag:k8s"
  ]

  cert_manager_create_cluster_issuer = true
  cert_manager_cluster_issuer_name = "letsencrypt"
  cert_manager_acme_email_secret_name = "k8s-certmanager-acme-email"
  cert_manager_dns_provider = "cloudflare"
  cert_manager_dns_provider_email_secret_name = "k8s-certmanager-cloudflare-email"
  cert_manager_dns_provider_api_token_secret_name = "k8s-certmanager-cloudflare-api-token"
}

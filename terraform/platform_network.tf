module "network" {
  source = "git::https://github.com/ParksBra/home-k8s-tf-platform-network//terraform?ref=1.2.0"

  cert_manager_namespace = local.cert_manager_namespace
  cert_manager_create_namespace = true

  tailscale_operator_namespace = local.tailscale_operator_namespace
  tailscale_operator_create_namespace = true

  tigera_operator_namespace = local.tigera_operator_namespace
  tigera_operator_create_namespace = true

  ingress_nginx_namespace = local.ingress_nginx_namespace
  ingress_nginx_create_namespace = true

  pod_network_cidr = local.pod_network_cidr

  tailscale_oauth_client_id = data.infisical_secrets.environment.secrets[local.tailscale_oauth_client_id_infisical_secret_name].value
  tailscale_oauth_client_secret = data.infisical_secrets.environment.secrets[local.tailscale_oauth_client_secret_infisical_secret_name].value

  tailscale_operator_default_tags = local.tailscale_operator_default_tags
  tailscale_proxy_default_tags = local.tailscale_proxy_default_tags

  cert_manager_acme_email = data.infisical_secrets.environment.secrets[local.cert_manager_acme_email_infisical_secret_name].value
  cert_manager_dns_solver_email = data.infisical_secrets.environment.secrets[local.cert_manager_dns_provider_email_infisical_secret_name].value
  cert_manager_dns_solver_api_token = data.infisical_secrets.environment.secrets[local.cert_manager_dns_provider_api_token_infisical_secret_name].value
  cert_manager_dns_solver_provider = local.cert_manager_dns_provider

  cert_manager_create_cluster_issuer = local.cert_manager_create_cluster_issuer
  cert_manager_cluster_issuer_name = local.cert_manager_cluster_issuer_name
}

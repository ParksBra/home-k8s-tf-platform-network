module "network" {
  source = "./modules/_network"
  depends_on = [
    data.azuredevops_variable_group.library
  ]

  cert_manager_namespace = local.cert_manager_namespace
  cert_manager_create_namespace = true

  tailscale_operator_namespace = local.tailscale_operator_namespace
  tailscale_operator_create_namespace = true

  tigera_operator_namespace = local.tigera_operator_namespace
  tigera_operator_create_namespace = true

  ingress_nginx_namespace = local.ingress_nginx_namespace
  ingress_nginx_create_namespace = true

  pod_network_cidr = var.pod_network_cidr

  tailscale_oauth_client_id = var.tailscale_oauth_client_id
  tailscale_oauth_client_secret = var.tailscale_oauth_client_secret

  tailscale_operator_default_tags = var.tailscale_operator_default_tags
  tailscale_proxy_default_tags = var.tailscale_proxy_default_tags

  cert_manager_acme_email = var.cert_manager_acme_email
  cert_manager_dns_solver_email = var.cert_manager_dns_provider_email
  cert_manager_dns_solver_api_token = var.cert_manager_dns_provider_api_token
  cert_manager_dns_solver_provider = var.cert_manager_dns_provider

  cert_manager_create_cluster_issuer = local.cert_manager_create_cluster_issuer
  cert_manager_cluster_issuer_name = local.cert_manager_cluster_issuer_name
}

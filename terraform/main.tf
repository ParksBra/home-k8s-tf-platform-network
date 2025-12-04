module "network" {
  source = "./modules/_network"

  cert_manager_namespace = local.cert_manager_namespace
  cert_manager_create_namespace = true

  tailscale_operator_namespace = local.tailscale_operator_namespace
  tailscale_operator_create_namespace = true

  tigera_operator_namespace = local.tigera_operator_namespace
  tigera_operator_create_namespace = true

  ingress_nginx_namespace = local.ingress_nginx_namespace
  ingress_nginx_create_namespace = true

  pod_network_cidr = local.pod_network_cidr

  # tailscale_oauth_client_id = data.azurerm_key_vault_secret.tailscale_oauth_client_id.value
  # tailscale_oauth_client_secret = data.azurerm_key_vault_secret.tailscale_oauth_client_secret.value
  tailscale_oauth_client_id = var.tailscale_oauth_client_id
  tailscale_oauth_client_secret = var.tailscale_oauth_client_secret

  tailscale_operator_default_tags = local.tailscale_operator_default_tags
  tailscale_proxy_default_tags = local.tailscale_proxy_default_tags

  # cert_manager_acme_email = data.azurerm_key_vault_secret.cert_manager_acme_email.value
  # cert_manager_dns_solver_email = data.azurerm_key_vault_secret.cert_manager_dns_provider_email.value
  # cert_manager_dns_solver_api_token = data.azurerm_key_vault_secret.cert_manager_dns_provider_api_token.value
  cert_manager_acme_email = var.cert_manager_acme_email
  cert_manager_dns_solver_email = var.cert_manager_dns_provider_email
  cert_manager_dns_solver_api_token = var.cert_manager_dns_provider_api_token
  cert_manager_dns_solver_provider = local.cert_manager_dns_provider

  cert_manager_create_cluster_issuer = local.cert_manager_create_cluster_issuer
  cert_manager_cluster_issuer_name = local.cert_manager_cluster_issuer_name
}

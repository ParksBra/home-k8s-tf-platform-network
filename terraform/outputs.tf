output "cert_manager_cluster_issuer_enabled" {
  description = "Whether the cert-manager ClusterIssuer is enabled"
  value       = module.network.cert_manager_cluster_issuer_enabled
}

output "cert_manager_cluster_issuer_name" {
  description = "The name of the cert-manager ClusterIssuer"
  value       = module.network.cert_manager_cluster_issuer_name
}

output "primary_ingress_class_name" {
  description = "The name of the primary ingress class"
  value       = module.network.primary_ingress_class_name
}

output "pod_network_cidr" {
  description = "The CIDR range for pod networking"
  value       = local.pod_network_cidr
}

output "pod_service_cidr" {
  description = "The CIDR range for pod services"
  value       = local.pod_service_cidr
}

output "primary_storage_class_name" {
  description = "The name of the primary storage class"
  value       = kubernetes_storage_class.service.metadata[0].name
}

output "external_ingress_ip" {
  description = "The external IP address of the ingress controller"
  value       = module.network.ingress_nginx_service_loadbalancer_ip
}

output "external_http_port" {
  description = "The external HTTP port of the ingress controller"
  value       = module.network.ingress_nginx_http_port
}

output "external_https_port" {
  description = "The external HTTPS port of the ingress controller"
  value       = module.network.ingress_nginx_https_port
}

output "pod_network_cidr" {
  description = "The cluster's pod network CIDR for use by other modules."
  value       = local.pod_network_cidr
}

output "pod_service_cidr" {
  description = "The cluster's pod service CIDR for use by other modules."
  value       = local.pod_service_cidr
}

output "cluster_domain" {
  description = "The parent domain name for use by other modules."
  value       = local.cluster_domain
}

output "external_parent_domain" {
  description = "The external parent domain name for use by other modules."
  value       = local.external_parent_domain
}

output "dns_ttl_seconds" {
  description = "The TTL (in seconds) for DNS records managed by Terraform."
  value       = local.dns_ttl_seconds
}

output "dns_records_default_comment" {
  description = "The default comment for DNS records managed by Terraform."
  value       = local.dns_records_default_comment
}

output "dns_records_proxy_enabled" {
  description = "Whether DNS records managed by Terraform are proxied."
  value       = local.dns_records_proxy_enabled
}

output "dns_provider_api_token_infisical_secret_name" {
  description = "The Infisical secret name for the DNS provider API token."
  value       = local.cloudflare_provider_api_token_infisical_secret_name
}

resource "kubernetes_config_map" "context" {
  depends_on = [
    kubernetes_namespace.context,
    module.network
  ]
  metadata {
    name      = local.platform_context_configmap_name
    namespace = kubernetes_namespace.context.metadata[0].name
  }

  data = {
    cert_manager_cluster_issuer_created       = tostring(module.network.cert_manager_cluster_issuer_created)
    cert_manager_cluster_issuer_name          = module.network.cert_manager_cluster_issuer_name
    primary_ingress_class_name                = module.network.primary_ingress_class_name
    external_ingress_ip                       = module.network.ingress_nginx_service_loadbalancer_ip
    external_http_port                        = module.network.ingress_nginx_http_port
    external_https_port                       = module.network.ingress_nginx_https_port
    pod_network_cidr                          = var.pod_network_cidr
    service_network_cidr                      = var.service_network_cidr
    cluster_domain                            = var.cluster_domain
    external_domain                           = var.external_domain
    dns_ttl_seconds                           = tostring(var.dns_ttl_seconds)
    dns_records_default_comment               = local.dns_records_default_comment
    dns_records_proxy_enabled                 = tostring(var.dns_records_proxy_enabled)
  }
}

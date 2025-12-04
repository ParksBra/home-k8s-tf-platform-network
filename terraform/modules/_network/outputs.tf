output "cni_pod_network_cidr" {
  description = "The Pod Network CIDR used by the CNI (Tigera Operator / Calico) for use by other modules."
  value       = var.tigera_operator_enabled ? module.cni[0].pod_network_cidr : var.pod_network_cidr
}

output "tailscale_ingress_class_name" {
  description = "The Ingress class name provided by the TailScale operator for use by other modules."
  value       = var.tailscale_enabled ? module.tailscale[0].ingress_class_name : ""
}

output "tailscale_operator_default_tags" {
  description = "The default tags applied to TailScale operator entries for use by other modules."
  value       = var.tailscale_enabled ? module.tailscale[0].operator_default_tags : []
}

output "tailscale_proxy_default_tags" {
  description = "The default tags applied to TailScale proxy entries for use by other modules."
  value       = var.tailscale_enabled ? module.tailscale[0].proxy_default_tags : []
}

output "ingress_nginx_http_port" {
  description = "The HTTP port used by the Ingress NGINX controller."
  value       = var.ingress_nginx_enabled ? module.ingress_nginx[0].http_port : null
}

output "ingress_nginx_https_port" {
  description = "The HTTPS port used by the Ingress NGINX controller."
  value       = var.ingress_nginx_enabled ? module.ingress_nginx[0].https_port : null
}

output "cert_manager_namespace" {
  description = "The namespace where Cert-Manager is deployed."
  value       = var.cert_manager_enabled ? data.kubernetes_namespace.cert_manager[0].metadata[0].name : ""
}

output "tailscale_operator_namespace" {
  description = "The namespace where the Tailscale operator is deployed."
  value       = var.tailscale_enabled ? data.kubernetes_namespace.tailscale_operator[0].metadata[0].name : ""
}

output "ingress_nginx_namespace" {
  description = "The namespace where Ingress NGINX is deployed."
  value       = var.ingress_nginx_enabled ? data.kubernetes_namespace.ingress_nginx[0].metadata[0].name : ""
}

output "tigera_operator_namespace" {
  description = "The namespace where the Tigera Operator is deployed."
  value       = var.tigera_operator_enabled ? data.kubernetes_namespace.tigera_operator[0].metadata[0].name : ""
}

output "cert_manager_cluster_issuer_name" {
  description = "The name of the ClusterIssuer created by Cert-Manager."
  value       = var.cert_manager_enabled ? module.cert_manager[0].cluster_issuer_name : ""
}

output "cert_manager_cluster_issuer_created" {
  description = "Whether the ClusterIssuer was created by Cert-Manager."
  value       = var.cert_manager_enabled ? var.cert_manager_create_cluster_issuer : false
}

output "cert_manager_acme_server" {
  description = "The ACME server URL used by Cert-Manager."
  value       = var.cert_manager_enabled ? module.cert_manager[0].cluster_issuer_server : ""
}

output "ingress_nginx_service_type" {
  description = "The Service type used by the Ingress NGINX controller."
  value       = var.ingress_nginx_enabled ? module.ingress_nginx[0].service_type : ""
}

output "ingress_nginx_service_loadbalancer_ip" {
  description = "The LoadBalancer IP assigned to the Ingress NGINX controller (if applicable)."
  value       = var.ingress_nginx_enabled ? module.ingress_nginx[0].service_loadbalancer_ip : null
}

output "primary_ingress_class_name" {
  description = "The primary Ingress class name to be used by other modules."
  value       = var.ingress_nginx_ingress_class_name
}

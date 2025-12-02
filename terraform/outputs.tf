
output "cni_pod_network_cidr" {
  description = "The Pod Network CIDR used by the CNI (Tigera Operator / Calico) for use by other modules."
  value       = module.cni.pod_network_cidr
}

output "tailscale_ingress_class_name" {
  description = "The Ingress class name provided by the TailScale operator for use by other modules."
  value       = module.tailscale.ingress_class_name
}

output "tailscale_operator_default_tags" {
  description = "The default tags applied to TailScale operator entries for use by other modules."
  value       = module.tailscale.operator_default_tags
}

output "tailscale_proxy_default_tags" {
  description = "The default tags applied to TailScale proxy entries for use by other modules."
  value       = module.tailscale.proxy_default_tags
}

output "ingress_nginx_http_port" {
  description = "The HTTP port used by the Ingress NGINX controller."
  value       = module.ingress_nginx.http_port
}

output "ingress_nginx_https_port" {
  description = "The HTTPS port used by the Ingress NGINX controller."
  value       = module.ingress_nginx.https_port
}

output "cert_manager_namespace_name" {
  description = "The namespace where Cert-Manager is deployed."
  value       = data.kubernetes_namespace.cert_manager_namespace.metadata[0].name
}

output "cert_manager_namespace_id" {
  description = "The ID of the namespace where Cert-Manager is deployed."
  value       = data.kubernetes_namespace.cert_manager_namespace.id
}

output "tailscale_operator_namespace_name" {
  description = "The namespace where the Tailscale operator is deployed."
  value       = data.kubernetes_namespace.tailscale_operator_namespace.metadata[0].name
}

output "tailscale_operator_namespace_id" {
  description = "The ID of the namespace where the Tailscale operator is deployed."
  value       = data.kubernetes_namespace.tailscale_operator_namespace.id
}

output "ingress_nginx_namespace_name" {
  description = "The namespace where Ingress NGINX is deployed."
  value       = data.kubernetes_namespace.ingress_nginx_namespace.metadata[0].name
}

output "ingress_nginx_namespace_id" {
  description = "The ID of the namespace where Ingress NGINX is deployed."
  value       = data.kubernetes_namespace.ingress_nginx_namespace.id
}

output "tigera_operator_namespace_name" {
  description = "The namespace where the Tigera Operator is deployed."
  value       = data.kubernetes_namespace.tigera_operator_namespace.metadata[0].name
}

output "tigera_operator_namespace_id" {
  description = "The ID of the namespace where the Tigera Operator is deployed."
  value       = data.kubernetes_namespace.tigera_operator_namespace.id
}

output "cert_manager_cluster_issuer_name" {
  description = "The name of the ClusterIssuer created by Cert-Manager."
  value       = module.cert_manager.cluster_issuer_name
}

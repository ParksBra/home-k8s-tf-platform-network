
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

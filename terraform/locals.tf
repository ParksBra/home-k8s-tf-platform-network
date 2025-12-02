locals {
  cert_manager_dns_solver_secret_key = "api-token"
  cert_manager_dns_solver_secret_name = "dns-solver-api-token-secret"

  nginx_service_type = var.tailscale_enabled ? "LoadBalancer" : "ClusterIP"
  nginx_loadbalancer_class_name = var.tailscale_enabled ? module.tailscale[0].ingress_class_name : "nginx"
}

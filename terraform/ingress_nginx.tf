module "ingress_nginx" {
  count = var.ingress_nginx_enabled ? 1 : 0
  depends_on = [
    module.cni,
    module.tailscale,
    data.kubernetes_namespace.ingress_nginx,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/ingress_nginx?ref=create_nginx_external_ip"

  namespace                   = data.kubernetes_namespace.ingress_nginx[0].metadata[0].name
  create_namespace            = false

  service_type                = local.nginx_service_type
  service_load_balancer_class = local.nginx_loadbalancer_class_name
}

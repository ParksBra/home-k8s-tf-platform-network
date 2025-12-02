module "ingress_nginx" {
  count = var.ingress_nginx_enabled ? 1 : 0
  depends_on = [
    module.cni,
    module.tailscale,
    data.kubernetes_namespace.ingress_nginx,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/ingress_nginx?ref=1.1.0"

  chart_cleanup_on_fail       = var.chart_cleanup_on_fail
  chart_dependency_update     = var.chart_dependency_update
  chart_linting_enabled       = var.chart_linting_enabled
  chart_recreate_pods         = var.chart_recreate_pods
  chart_replace               = var.chart_replace
  chart_upgrade_install       = var.chart_upgrade_install

  namespace                   = data.kubernetes_namespace.ingress_nginx[0].metadata[0].name
  create_namespace            = false

  service_type                = local.nginx_service_type
  service_load_balancer_class = local.nginx_loadbalancer_class_name
}

module "ingress_nginx" {
  depends_on = [
    module.cni,
    module.tailscale,
    data.kubernetes_namespace.ingress_nginx_namespace,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/ingress_nginx?ref=create_platform_tf"

  namespace           = data.kubernetes_namespace.ingress_nginx_namespace.metadata[0].name
  create_namespace    = false

  service_load_balancer_class = module.tailscale.ingress_class_name
}

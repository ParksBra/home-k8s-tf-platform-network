module "ingress_nginx" {
  depends_on = [
    module.cni,
    module.tailscale,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/ingress_nginx?ref=create_platform_tf"

  service_load_balancer_class = module.tailscale.ingress_class_name
}

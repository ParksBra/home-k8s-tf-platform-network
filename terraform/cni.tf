module "cni" {
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/tigera_operator?ref=create_platform_tf"

  pod_network_cidr = var.pod_network_cidr
}

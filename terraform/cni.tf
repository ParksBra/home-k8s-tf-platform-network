module "cni" {
  depends_on = [
    data.kubernetes_namespace.tigera_operator,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/tigera_operator?ref=create_platform_tf"

  namespace           = data.kubernetes_namespace.tigera_operator.metadata[0].name
  create_namespace    = false

  pod_network_cidr = var.pod_network_cidr
}

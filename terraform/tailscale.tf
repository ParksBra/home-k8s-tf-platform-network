module "tailscale" {
  count = var.tailscale_enabled ? 1 : 0
  depends_on = [
    module.cni,
    data.kubernetes_namespace.tailscale_operator,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/tailscale?ref=create_platform_tf"

  namespace           = data.kubernetes_namespace.tailscale_operator[0].metadata[0].name
  create_namespace    = false

  oauth_client_id     = var.tailscale_oauth_client_id
  oauth_client_secret = var.tailscale_oauth_client_secret

  operator_default_tags = var.tailscale_operator_default_tags
  proxy_default_tags    = var.tailscale_proxy_default_tags
}

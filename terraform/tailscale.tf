module "tailscale" {
  depends_on = [
    module.cni,
  ]
  source = "github.com/ParksBra/home-k8s-tf-lib//modules/tailscale?ref=create_platform_tf"

  oauth_client_id     = var.tailscale_oauth_client_id
  oauth_client_secret = var.tailscale_oauth_client_secret

  operator_default_tags = var.tailscale_operator_default_tags
  proxy_default_tags    = var.tailscale_proxy_default_tags
}

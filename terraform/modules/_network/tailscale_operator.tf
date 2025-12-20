module "tailscale" {
  count = var.tailscale_enabled ? 1 : 0
  depends_on = [
    module.cni,
    data.kubernetes_namespace.tailscale_operator,
  ]
  source = "../tailscale"

  chart_cleanup_on_fail   = var.chart_cleanup_on_fail
  chart_dependency_update = var.chart_dependency_update
  chart_linting_enabled   = var.chart_linting_enabled
  chart_recreate_pods     = var.chart_recreate_pods
  chart_replace           = var.chart_replace
  chart_upgrade_install   = var.chart_upgrade_install

  namespace               = data.kubernetes_namespace.tailscale_operator[0].metadata[0].name
  create_namespace        = false

  oauth_client_id         = var.tailscale_oauth_client_id
  oauth_client_secret     = var.tailscale_oauth_client_secret

  operator_default_tags   = var.tailscale_operator_default_tags
  proxy_default_tags      = var.tailscale_proxy_default_tags
}

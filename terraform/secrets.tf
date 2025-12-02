resource "kubernetes_secret" "cert_manager_dns_solver_api_token" {
  count = var.cert_manager_enabled ? 1 : 0
  depends_on = [
    data.kubernetes_namespace.cert_manager
  ]
  metadata {
    name      = local.cert_manager_dns_solver_secret_name
    namespace = data.kubernetes_namespace.cert_manager[0].metadata[0].name
  }
  data = {
    "${local.cert_manager_dns_solver_secret_key}" = var.cert_manager_dns_solver_api_token
  }
  type = "Opaque"
}

resource "kubernetes_secret" "cert_manager_dns_solver_api_token" {
  depends_on = [
    data.kubernetes_namespace.cert_manager_namespace
  ]
  metadata {
    name      = "dns-solver-api-token-secret"
    namespace = data.kubernetes_namespace.cert_manager_namespace.metadata[0].name
  }
  data = {
    "${local.cert_manager_dns_solver_secret_key}" = var.cert_manager_dns_solver_api_token
  }
  type = "Opaque"
}

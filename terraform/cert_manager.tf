module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"
  depends_on = [
    data.kubernetes_namespace.cert_manager,
    kubernetes_secret.cert_manager_dns_solver_api_token
  ]

  namespace_name        = data.kubernetes_namespace.cert_manager.metadata[0].name
  create_namespace      = false
  cluster_issuer_email  = var.cert_manager_acme_email
  cluster_issuer_create = var.cert_manager_create_cluster_issuer
  cluster_issuer_name   = var.cert_manager_cluster_issuer_name
  solvers               = [
    {
      dns01 = {
        "${var.cert_manager_dns_solver_provider}" = {
          email = var.cert_manager_dns_solver_email
          apiTokenSecretRef = {
            name = kubernetes_secret.cert_manager_dns_solver_api_token.metadata[0].name
            key  = local.cert_manager_dns_solver_secret_key
          }
        }
      }
    }
  ]
}

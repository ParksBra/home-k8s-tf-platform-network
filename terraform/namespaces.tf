resource "kubernetes_namespace" "cert_manager" {
  count = var.cert_manager_create_namespace ? 1 : 0
  metadata {
    name = var.cert_manager_namespace
  }
}

data "kubernetes_namespace" "cert_manager" {
  depends_on = [
    kubernetes_namespace.cert_manager,
  ]
  metadata {
    name = var.cert_manager_namespace
  }
}

resource "kubernetes_namespace" "tailscale_operator" {
  count = var.tailscale_operator_create_namespace ? 1 : 0
  metadata {
    name = var.tailscale_operator_namespace
  }
}

data "kubernetes_namespace" "tailscale_operator" {
  depends_on = [
    kubernetes_namespace.tailscale_operator,
  ]
  metadata {
    name = var.tailscale_operator_namespace
  }
}

resource "kubernetes_namespace" "ingress_nginx" {
  count = var.ingress_nginx_create_namespace ? 1 : 0
  metadata {
    name = var.ingress_nginx_namespace
  }
}

data "kubernetes_namespace" "ingress_nginx" {
  depends_on = [
    kubernetes_namespace.ingress_nginx,
  ]
  metadata {
    name = var.ingress_nginx_namespace
  }
}

resource "kubernetes_namespace" "tigera_operator" {
  count = var.tigera_operator_create_namespace ? 1 : 0
  metadata {
    name = var.tigera_operator_namespace
  }
}

data "kubernetes_namespace" "tigera_operator" {
  depends_on = [
    kubernetes_namespace.tigera_operator,
  ]
  metadata {
    name = var.tigera_operator_namespace
  }
}

resource "kubernetes_namespace" "cert_manager_namespace" {
  count = var.cert_manager_create_namespace ? 1 : 0
  metadata {
    name = var.cert_manager_namespace
  }
}

data "kubernetes_namespace" "cert_manager_namespace" {
  depends_on = [
    kubernetes_namespace.cert_manager_namespace,
  ]
  metadata {
    name = var.cert_manager_namespace
  }
}

resource "kubernetes_namespace" "tailscale_operator_namespace" {
  count = var.tailscale_operator_create_namespace ? 1 : 0
  metadata {
    name = var.tailscale_operator_namespace
  }
}

data "kubernetes_namespace" "tailscale_operator_namespace" {
  depends_on = [
    kubernetes_namespace.tailscale_operator_namespace,
  ]
  metadata {
    name = var.tailscale_operator_namespace
  }
}

resource "kubernetes_namespace" "ingress_nginx_namespace" {
  count = var.ingress_nginx_create_namespace ? 1 : 0
  metadata {
    name = var.ingress_nginx_namespace
  }
}

data "kubernetes_namespace" "ingress_nginx_namespace" {
  depends_on = [
    kubernetes_namespace.ingress_nginx_namespace,
  ]
  metadata {
    name = var.ingress_nginx_namespace
  }
}

resource "kubernetes_namespace" "tigera_operator_namespace" {
  count = var.tigera_operator_create_namespace ? 1 : 0
  metadata {
    name = var.tigera_operator_namespace
  }
}

data "kubernetes_namespace" "tigera_operator_namespace" {
  depends_on = [
    kubernetes_namespace.tigera_operator_namespace,
  ]
  metadata {
    name = var.tigera_operator_namespace
  }
}

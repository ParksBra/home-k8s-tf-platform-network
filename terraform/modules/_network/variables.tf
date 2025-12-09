# Chart shared variables
variable "chart_linting_enabled" {
  description = "Whether to enable Helm chart linting."
  type        = bool
  default     = true
}

variable "chart_recreate_pods" {
  description = "Whether to recreate pods when deploying the Helm chart."
  type        = bool
  default     = false
}

variable "chart_upgrade_install" {
  description = "Whether to install the Helm chart if it is not already installed during an upgrade."
  type        = bool
  default     = true
}

variable "chart_replace" {
  description = "Whether to replace the Helm chart if it is already installed."
  type        = bool
  default     = false
}

variable "chart_dependency_update" {
  description = "Whether to update chart dependencies before installing or upgrading the Helm chart."
  type        = bool
  default     = true
}

variable "chart_cleanup_on_fail" {
  description = "Whether to cleanup resources if the Helm chart installation or upgrade fails."
  type        = bool
  default     = true
}

# Network and namespaces
variable "pod_network_cidr" {
  description = "The Pod Network CIDR for the Tigera Operator (Calico) configuration."
  type        = string
}

variable "cert_manager_namespace" {
  description = "The namespace to deploy Cert-Manager into."
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_create_namespace" {
  description = "Whether to create the Cert-Manager namespace."
  type        = bool
  default     = true
}

variable "tailscale_operator_namespace" {
  description = "The namespace to deploy Tailscale operator into."
  type        = string
  default     = "tailscale-operator"
}

variable "tailscale_operator_create_namespace" {
  description = "Whether to create the Tailscale operator namespace."
  type        = bool
  default     = true
}

variable "tigera_operator_enabled" {
  description = "Whether to enable the Tigera Operator (Calico CNI) module. Only disable if another CNI is being used."
  type        = bool
  default     = true
}

variable "tigera_operator_namespace" {
  description = "The namespace to deploy the Tigera Operator into."
  type        = string
  default     = "tigera-operator"
}

variable "tigera_operator_create_namespace" {
  description = "Whether to create the Tigera Operator namespace."
  type        = bool
  default     = true
}

variable "ingress_nginx_enabled" {
  description = "Whether to enable the Ingress NGINX module."
  type        = bool
  default     = true
}

variable "ingress_nginx_namespace" {
  description = "The namespace to deploy Ingress NGINX into."
  type        = string
  default     = "ingress-nginx"
}

variable "ingress_nginx_create_namespace" {
  description = "Whether to create the Ingress NGINX namespace."
  type        = bool
  default     = true
}

variable "ingress_nginx_ingress_class_resource_name" {
  description = "The Ingress class name to use for the Ingress NGINX controller."
  type        = string
  default     = "nginx"
}

variable "tailscale_enabled" {
  description = "Whether to enable the Tailscale operator module."
  type        = bool
  default     = true
}

variable "tailscale_oauth_client_id" {
  description = "The OAuth Client ID for Tailscale operator authentication."
  type        = string
  sensitive   = true
}

variable "tailscale_oauth_client_secret" {
  description = "The OAuth Client Secret for Tailscale operator authentication."
  type        = string
  sensitive   = true
}

variable "tailscale_operator_default_tags" {
  description = "Default tags to add to Tailscale entries."
  type        = list
  default     = [
    "tag:k8s-operator"
  ]
}

variable "tailscale_proxy_default_tags" {
  description = "Default tags to add to Tailscale proxy entries."
  type        = list
  default     = [
    "tag:k8s"
  ]
}

variable "cert_manager_enabled" {
  description = "Whether to enable the Cert-Manager module."
  type        = bool
  default     = true
}

variable "cert_manager_create_cluster_issuer" {
  description = "Whether to create a ClusterIssuer resource."
  type        = bool
  default     = true
}

variable "cert_manager_cluster_issuer_name" {
  description = "The name of the ClusterIssuer resource to create."
  type        = string
  default     = "letsencrypt"
}

variable "cert_manager_acme_server" {
  description = "The ACME server URL for Cert-Manager."
  type        = string
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "cert_manager_acme_email" {
  description = "The email address to use for ACME registration."
  type        = string
  default     = "example@example.com"
}

variable "cert_manager_dns_solver_email" {
  description = "The email address associated with the DNS provider account."
  type        = string
  default     = "example@example.com"
}

variable "cert_manager_dns_solver_api_token" {
  description = "The API token associated with the DNS provider account."
  type        = string
  default     = null
  sensitive   = true
}

variable "cert_manager_dns_solver_provider" {
  description = "The DNS provider to use for DNS01 challenge solving."
  type        = string
  default     = "cloudflare"
}

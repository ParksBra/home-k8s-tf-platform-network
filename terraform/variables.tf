variable "pod_network_cidr" {
  description = "The Pod Network CIDR for the Tigera Operator (Calico) configuration."
  type        = string
}

variable "service_network_cidr" {
  description = "The Service Network CIDR for the Kubernetes cluster."
  type        = string
}

variable "cluster_domain" {
  description = "The cluster domain for the Kubernetes cluster."
  type        = string
}

variable "external_domain" {
  description = "The external domain for the Kubernetes cluster."
  type        = string
}

variable "dns_ttl_seconds" {
  description = "The TTL (in seconds) for DNS records managed by the platform."
  type        = number
  default     = 1
}

variable "dns_records_proxy_enabled" {
  description = "Whether DNS records managed by the platform should have proxying enabled."
  type        = bool
  default     = false
}

variable "cert_manager_acme_email" {
  description = "The ACME email address for Cert-Manager."
  type        = string
}

variable "cert_manager_dns_provider" {
  description = "The DNS provider to use for Cert-Manager DNS-01 challenges."
  type        = string
  default     = "cloudflare"
}

variable "cert_manager_dns_provider_email" {
  description = "The email address associated with the DNS provider for Cert-Manager DNS-01 challenges."
  type        = string
}

variable "cert_manager_dns_provider_api_token" {
  description = "The API token for the DNS provider for Cert-Manager DNS-01 challenges."
  type        = string
  sensitive   = true
}

variable "tailscale_oauth_client_id" {
  description = "The OAuth Client ID for the Tailscale Operator."
  type        = string
  sensitive   = true
}

variable "tailscale_oauth_client_secret" {
  description = "The OAuth Client Secret for the Tailscale Operator."
  type        = string
  sensitive   = true
}

variable "tailscale_operator_default_tags" {
  description = "Default tags to add to Tailscale entries created by the Tailscale Operator."
  type        = list(string)
  default     = [
    "tag:k8s-operator"
  ]
}

variable "tailscale_proxy_default_tags" {
  description = "Default tags to add to Tailscale proxy entries created by the Tailscale Operator."
  type        = list(string)
  default     = [
    "tag:k8s"
  ]
}

variable "ingress_nginx_ingress_class_resource_name" {
  description = "The Ingress class resource name to use for the Ingress NGINX controller."
  type        = string
  default     = "nginx"
}

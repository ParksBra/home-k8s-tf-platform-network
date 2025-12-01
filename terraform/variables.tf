variable "pod_network_cidr" {
  description = "The Pod Network CIDR for the Tigera Operator (Calico) configuration."
  type        = string
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

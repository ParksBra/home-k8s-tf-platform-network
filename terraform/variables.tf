# variable "pod_network_cidr" {
#   description = "The CIDR for the pod network"
#   type        = string
# }

# variable "service_network_cidr" {
#   description = "The CIDR for the service network"
#   type        = string
# }

# variable "cluster_domain" {
#   description = "The cluster domain (e.g., cluster.local)"
#   type        = string
# }

# variable "cert_manager_acme_email" {
#   description = "Email address for cert-manager ACME registration"
#   type        = string
# }

# variable "cert_manager_dns_provider_email" {
#   description = "Email address for cert-manager DNS provider"
#   type        = string
# }

# variable "cert_manager_dns_provider_api_token" {
#   description = "API token for cert-manager DNS provider"
#   type        = string
#   sensitive   = true
# }

# variable "tailscale_oauth_client_id" {
#   description = "OAuth client ID for Tailscale"
#   type        = string
#   sensitive   = true
# }

# variable "tailscale_oauth_client_secret" {
#   description = "OAuth client secret for Tailscale"
#   type        = string
#   sensitive   = true
# }

variable "azuredevops_library_project_id" {
  description = "The Azure DevOps project ID containing the variable library"
  type        = string
}

variable "azuredevops_library_name" {
  description = "The name of the Azure DevOps variable library"
  type        = string
}

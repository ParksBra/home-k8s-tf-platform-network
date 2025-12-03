variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
}

variable "python_executable" {
  description = "Path to the Python executable"
  type        = string
}

variable "infisical_url" {
  description = "The Infisical API URI"
  type        = string
}

variable "infisical_auth_client_id" {
  description = "The Infisical Auth Client ID"
  type        = string
  sensitive   = true
}

variable "infisical_auth_client_secret" {
  description = "The Infisical Auth Client Secret"
  type        = string
  sensitive   = true
}

variable "infisical_project_id" {
  description = "The Infisical Project ID"
  type        = string
}

variable "infisical_environment_slug" {
  description = "The Infisical Environment Slug"
  type        = string
}

variable "pod_network_cidr" {
  description = "The CIDR for the pod network"
  type        = string
}

variable "service_network_cidr" {
  description = "The CIDR for the service network"
  type        = string
}

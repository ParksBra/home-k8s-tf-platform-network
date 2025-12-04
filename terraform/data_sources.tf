# data "azurerm_key_vault" "primary" {
#   name                = var.azure_key_vault_name
#   resource_group_name = var.azure_resource_group_name
# }

# data "azurerm_key_vault_secret" "cloudflare_provider_api_token" {
#   name         = local.cloudflare_provider_api_token_secret_name
#   key_vault_id = data.azurerm_key_vault.primary.id
# }

# data "azurerm_key_vault_secret" "cert_manager_acme_email" {
#   name         = local.cert_manager_acme_email_secret_name
#   key_vault_id = data.azurerm_key_vault.primary.id
# }

# data "azurerm_key_vault_secret" "cert_manager_dns_provider_email" {
#   name         = local.cert_manager_dns_provider_email_secret_name
#   key_vault_id = data.azurerm_key_vault.primary.id
# }

# data "azurerm_key_vault_secret" "cert_manager_dns_provider_api_token" {
#   name         = local.cert_manager_dns_provider_api_token_secret_name
#   key_vault_id = data.azurerm_key_vault.primary.id
# }

# data "azurerm_key_vault_secret" "tailscale_oauth_client_id" {
#   name         = local.tailscale_oauth_client_id_secret_name
#   key_vault_id = data.azurerm_key_vault.primary.id
# }

# data "azurerm_key_vault_secret" "tailscale_oauth_client_secret" {
#   name         = local.tailscale_oauth_client_secret_secret_name
#   key_vault_id = data.azurerm_key_vault.primary.id
# }

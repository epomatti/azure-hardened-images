resource "random_string" "affix" {
  upper   = false
  special = false
  length  = 5
}

resource "azurerm_storage_account" "blob" {
  name                          = "st${var.workload}${random_string.affix.result}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  account_kind                  = "StorageV2"
  https_traffic_only_enabled    = true
  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true
}

resource "azurerm_storage_container" "blobs" {
  name                  = "blobs"
  storage_account_id    = azurerm_storage_account.blob.id
  container_access_type = "private"
}

data "azuread_client_config" "current" {}

resource "azurerm_role_assignment" "current_user" {
  scope                = azurerm_storage_account.blob.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_client_config.current.object_id
}

resource "azurerm_role_assignment" "vm" {
  scope                = azurerm_storage_account.blob.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.user_assigned_identity_id
}

resource "azurerm_synapse_workspace" "synapseWorkspace" {
  name                                 = "${var.env}synapse${var.env}01wp01tf"
  resource_group_name                  = azurerm_resource_group.this.name
  location                             = azurerm_resource_group.this.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.dataLakefs.id
  sql_administrator_login              = var.sql_user
  sql_administrator_login_password     = var.sql_password
  data_exfiltration_protection_enabled = true 
  managed_virtual_network_enabled = true

  aad_admin {
    login     = "AzureAD Admin" // SQL DBA Admin account 
    object_id = data.azurerm_client_config.current.object_id
    tenant_id = data.azurerm_client_config.current.tenant_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = local.common_tags
}

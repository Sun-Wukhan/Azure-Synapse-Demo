
resource "azurerm_storage_account" "storage" {
  name                     = "${var.env}sasynapse${var.env}1tf"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  access_tier = "Hot"
  enable_https_traffic_only = true
  min_tls_version = "TLS1_2"
  shared_access_key_enabled = true
  
  network_rules {
    bypass = ["None"]
    virtual_network_subnet_ids = []
    ip_rules = []
    default_action = "Allow"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "dataLakefs" {
  name               = "${var.env}synapse01fstf"
  storage_account_id = azurerm_storage_account.storage.id
  depends_on         = [time_sleep.role_assignment_sleep]
  
  ace {
    type = "user"
    permissions = "rwx"
  }
}
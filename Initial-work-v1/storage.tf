
resource "azurerm_storage_account" "photon_storage" {
  name 			= "photon-terra-storage"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"
  location 		= "${var.location}"
  account_type 		= "Standard_LRS"

  tags {
	group = "Photon"
  }
}

resource "azurerm_storage_container" "photon_cont" {
  name 			= "vhds"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"
  storage_account_name 	= "${azurerm_storage_account.photon_storage.name}"
  container_access_type = "private"
}

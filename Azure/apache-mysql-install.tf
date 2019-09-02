
resource "azurerm_virtual_machine_extension" "cs_apache" {
  name 			= "custom_apache"
  location 		= "${var.location}"
  resource_group_name   = "${azurerm_resource_group.Photon_Terra_Group.name}"
  virtual_machine_name  = "${azurerm_virtual_machine.photon_web.name}"
  publisher 		= "Microsoft.OSTCExtensions"
  type 			= "CustomScriptForLinux"
  type_handler_version  = "1.2"

  settings = <<SETTINGS
  {
	"fileUris": [
	"LINK-TO-FILE-IN-AZURE-STORAGE-ACCOUNT"
	],
	"commandToExecute": "sh apache_php.sh"
  }
SETTINGS

  tags {
	group = "DB_Group"
  }
}

resource "azurerm_virtual_machine_extension" "cs_mysql" {
  name 			= "custom_mysql"
  location 		= "${var.location}"
  resource_group_name   = "${azurerm_resource_group.Photon_Terra_Group.name}"
  virtual_machine_name  = "${azurerm_virtual_machine.photon_db.name}"
  publisher 		= "Microsoft.OSTCExtensions"
  type 			= "CustomScriptForLinux"
  type_handler_version  = "1.2"

  settings = <<SETTINGS
  {
	"fileUris": [
	"LINK-TO-FILE-IN-AZURE-STORAGE-ACCOUNT"
	],
	"commandToExecute": "sh mysql_install.sh"
  }
SETTINGS

  tags {
	group = "Photon"
  }
}

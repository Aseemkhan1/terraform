
resource "azurerm_resource_group" "Photon_Terra_Group" {
  name 		= "${var.resource_group_name}"
  location 	= "${var.location}"
}

resource "azurerm_virtual_network" "Photon_Terra_VNet" {
  name 			= "Photon_Terra_VNet"
  address_space 	= ["${var.vnet_cidr}"]
  location 		= "${var.location}"
  resource_group_name   = "${azurerm_resource_group.Photon_Terra_Group.name}"

  tags {
	group = "Photon"
  }
}

resource "azurerm_subnet" "subnet_1" {
  name 			= "Subnet-1"
  address_prefix 	= "${var.subnet1_cidr}"
  virtual_network_name 	= "${azurerm_virtual_network.Photon_Terra_VNet.name}"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"
}

resource "azurerm_subnet" "subnet_2" {
  name 			= "Subnet-2"
  address_prefix 	= "${var.subnet2_cidr}"
  virtual_network_name 	= "${azurerm_virtual_network.Photon_Terra_VNet.name}"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"
}

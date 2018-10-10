
resource "azurerm_public_ip" "photon_pip" {
  name 				= "Photon-Terraform-PIP"
  location 			= "${var.location}"
  resource_group_name 		= "${azurerm_resource_group.Photon_Terra_Group.name}"
  public_ip_address_allocation 	= "static"

  tags {
	group = "Photon"
  }
}

resource "azurerm_network_interface" "public_nic" {
  name 		      = "Photon-Terraform-Web"
  location 	      = "${var.location}"
  resource_group_name = "${azurerm_resource_group.Photon_Terra_Group.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg_web.id}"

  ip_configuration {
    name 			= "Photon-Terraform-WebPrivate"
    subnet_id 			= "${azurerm_subnet.subnet_1.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id	= "${azurerm_public_ip.photon_pip.id}"
  }
  tags {
	group = "Photon"
  }
}

resource "azurerm_public_ip" "photon_db_pip" {
  name                  = "Photon-Terraform-DB-PIP"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.Photon_Terra_Group.name}"
  public_ip_address_allocation = "static"

  tags {
        group = "Photon"
  }
}

resource "azurerm_network_interface" "private_nic" {
  name 			= "Photon-Terraform-DB"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"
  network_security_group_id = "${azurerm_network_security_group.terraform_nsg_db.id}"

  ip_configuration {
    name 			= "Photon-Terraform-DBPrivate"
    subnet_id 			= "${azurerm_subnet.subnet_2.id}"
    private_ip_address_allocation = "static"
    private_ip_address = "192.168.2.5"
    public_ip_address_id        = "${azurerm_public_ip.photon_db_pip.id}"
  }
  tags {
	group = "Photon"
  }
}


resource "azurerm_network_security_group" "nsg_web" {
  name 			= "Photon-Terraform-Web-NSG"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"

  security_rule {
	name 			= "AllowSSH"
	priority 		= 100
	direction 		= "Inbound"
	access 		        = "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "22"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 			= "AllowHTTP"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "80"
    source_address_prefix      	= "Internet"
    destination_address_prefix 	= "*"
  }

  tags {
	group = "Photon"
  }
}

resource "azurerm_network_security_group" "terraform_nsg_db" {
  name 			= "Photon-Terraform-DB-NSG"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.Photon_Terra_Group.name}"

  security_rule {
	name 			= "AllowMySQL"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "3306"
    source_address_prefix      	= "${var.subnet1_cidr}"
    destination_address_prefix 	= "*"
  }

  tags {
	group = "Photon"
  }
}
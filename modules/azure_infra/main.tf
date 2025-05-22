resource "azurerm_resource_group" "adel" {
  name     = "adel2-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "adel" {
  name                = "${var.name_prefix}-adel2-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.adel.location
  resource_group_name = azurerm_resource_group.adel.name
}

resource "azurerm_subnet" "adel" {
  name                 = "${var.name_prefix}-adel2-subnet"
  resource_group_name  = azurerm_resource_group.adel.name
  virtual_network_name = azurerm_virtual_network.adel.name
  address_prefixes     = ["10.0.1.0/24"]
}


resource "azurerm_resource_group" "example" {
  name     = "${var.name_prefix}-example-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "adel" {
  name                = "${var.name_prefix}-acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.adel.location
  resource_group_name = azurerm_resource_group.adel.name
}

resource "azurerm_network_security_rule" "example" {
  for_each = toset(var.open_ports)
  name                        = "${var.name_prefix}-${each.key}-test123"
  priority                    = 100+each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = each.key
  destination_port_range      = each.key
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.adel.name
  network_security_group_name = azurerm_network_security_group.adel.name
}


resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.adel.id
  network_security_group_id = azurerm_network_security_group.adel.id
}
resource "oci_core_vcn" "vcn1" {
  dns_label      = "TollNY"
  cidr_block     = var.cidr
  compartment_id = var.compartment_ocid
  display_name   = "Tollny-Vcn1"
}

output "vcn_id" {
  value = oci_core_vcn.vcn1.id
}

resource "oci_core_internet_gateway" "Toll-ny_internet_gateway" {
  compartment_id = var.compartment_ocid
  display_name   = "Toll-ny_IGW"
  vcn_id         = oci_core_vcn.vcn1.id
}

resource "oci_core_nat_gateway" "Toll-ny-Nat-GW" {
    # required
    compartment_id = var.compartment_ocid
    vcn_id =  oci_core_vcn.vcn1.id
    display_name = "Tollny-Nat-GW"
}


resource "oci_core_route_table" "route_table1" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn1.id
  display_name   = "RouteTable1-Pub"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.Toll-ny_internet_gateway.id
  }
}

resource "oci_core_default_dhcp_options" "default_dhcp_options" {
  manage_default_resource_id = oci_core_vcn.vcn1.default_dhcp_options_id
  display_name               = "defaultDhcpOptions"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}
output "vcn_details" {
  value = [oci_core_vcn.vcn1.display_name, oci_core_internet_gateway.Toll-ny_internet_gateway.display_name, oci_core_route_table.route_table1.display_name, oci_core_default_dhcp_options.default_dhcp_options.display_name]
}


resource "oci_core_internet_gateway" "hub_igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.hub_vcn.id
  display_name   = "HubInternetGateway"
  enabled        = true
}

resource "oci_core_nat_gateway" "spoke_nat_1" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_1.id
  display_name   = "SpokeNATGateway1"
}

resource "oci_core_nat_gateway" "spoke_nat_2" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_2.id
  display_name   = "SpokeNATGateway2"
}

resource "oci_core_nat_gateway" "spoke_nat_3" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_3.id
  display_name   = "SpokeNATGateway3"
}

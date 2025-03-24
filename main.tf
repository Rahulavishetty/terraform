resource "oci_core_vcn" "hub_vcn" {
  cidr_block     = var.cidr[0]
  display_name   = "HubVCN"
  compartment_id = var.compartment_id
}

resource "oci_core_vcn" "spoke_vcn_1" {
  cidr_block     = var.cidr[1]
  display_name   = "SpokeVCN1"
  compartment_id = var.compartment_id
}

resource "oci_core_vcn" "spoke_vcn_2" {
  cidr_block     = var.cidr[2]
  display_name   = "SpokeVCN2"
  compartment_id = var.compartment_id
}

resource "oci_core_vcn" "spoke_vcn_3" {
  cidr_block     = var.cidr[3]
  display_name   = "SpokeVCN3"
  compartment_id = var.compartment_id
}


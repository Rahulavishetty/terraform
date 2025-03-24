# Subnet-1 Public
resource "oci_core_subnet" "Public-Sub-1" {
  cidr_block        = "172.16.0.0/26"
  display_name      = "TollNY-DB-Pub-Sub-1"
  dns_label         = "tollpub1"
  prohibit_public_ip_on_vnic = "false"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.vcn1.id
  security_list_ids = [oci_core_security_list.Public-SL-1.id]
  route_table_id    = oci_core_route_table.route_table1.id
  dhcp_options_id   = oci_core_vcn.vcn1.default_dhcp_options_id
}

# Subnet-2 Private
resource "oci_core_subnet" "Private-Sub-1" {
  cidr_block        = "172.16.0.64/26"
  display_name      = "TollNY-DB-Pri-Sub-1"
  dns_label         = "tollpriv1"
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.vcn1.id
  security_list_ids = [oci_core_security_list.Private-SL-1.id]
  prohibit_public_ip_on_vnic = "true"
  route_table_id    = oci_core_route_table.route_table2.id
  dhcp_options_id   = oci_core_vcn.vcn1.default_dhcp_options_id
}

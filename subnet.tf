resource "oci_core_subnet" "hub_subnet" {
  vcn_id            = oci_core_vcn.hub_vcn.id
  cidr_block        = local.hubsubnet_1
  display_name      = "HubSubnet"
  compartment_id    = var.compartment_id
  security_list_ids = [oci_core_security_list.hub_sl.id]
  route_table_id    = oci_core_route_table.hub_rt.id
}

resource "oci_core_subnet" "spoke_subnet_1" {
  vcn_id            = oci_core_vcn.spoke_vcn_1.id
  cidr_block        = local.spoke1subnet_1
  display_name      = "SpokeSubnet1"
  compartment_id    = var.compartment_id
  prohibit_public_ip_on_vnic = true
  security_list_ids = [oci_core_security_list.spoke_sl_1.id]
  route_table_id    = oci_core_route_table.spoke_rt_1.id
}

resource "oci_core_subnet" "spoke_subnet_2" {
  vcn_id            = oci_core_vcn.spoke_vcn_2.id
  cidr_block        = local.spoke2subnet_1
  display_name      = "SpokeSubnet2"
  compartment_id    = var.compartment_id
  prohibit_public_ip_on_vnic = true
  security_list_ids = [oci_core_security_list.spoke_sl_2.id]
  route_table_id    = oci_core_route_table.spoke_rt_2.id
}

resource "oci_core_subnet" "spoke_subnet_3" {
  vcn_id            = oci_core_vcn.spoke_vcn_3.id
  cidr_block        = local.spoke3subnet_1
  display_name      = "SpokeSubnet3"
  compartment_id    = var.compartment_id
  prohibit_public_ip_on_vnic = true
  security_list_ids = [oci_core_security_list.spoke_sl_3.id]
  route_table_id    = oci_core_route_table.spoke_rt_3.id
}


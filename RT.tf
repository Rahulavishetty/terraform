resource "oci_core_route_table" "hub_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.hub_vcn.id
  display_name   = "Hub_Pub_RT"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.hub_igw.id
  }
  route_rules {
    destination       = var.cidr[1]
    description       = "Hub to Spoke1 via DRG"
    network_entity_id = oci_core_drg.drg.id
  }
  route_rules {
    destination       = var.cidr[2]
    network_entity_id = oci_core_drg.drg.id
  }
  route_rules {
    destination       = var.cidr[3]
    network_entity_id = oci_core_drg.drg.id
  }
}

resource "oci_core_route_table" "spoke_rt_1" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_1.id
  display_name   = "Spoke1_RT"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_nat_gateway.spoke_nat_1.id
  }

route_rules {
    destination       = var.cidr[0]
    network_entity_id = oci_core_drg.drg.id
  }

}

resource "oci_core_route_table" "spoke_rt_2" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_2.id
  display_name   = "Spoke2_RT"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_nat_gateway.spoke_nat_2.id
  }
  route_rules {
    destination       = var.cidr[0]
    network_entity_id = oci_core_drg.drg.id
  }
}

resource "oci_core_route_table" "spoke_rt_3" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_3.id
  display_name   = "Spoke3_RT"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_nat_gateway.spoke_nat_3.id
  }
route_rules {
    destination       = var.cidr[0]
    network_entity_id = oci_core_drg.drg.id
  }
}

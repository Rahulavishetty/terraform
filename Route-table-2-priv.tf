resource "oci_core_route_table" "route_table2" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn1.id
  display_name   = "RouteTable2-Priv"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.Toll-ny-Nat-GW.id
  }


route_rules {
    destination       = data.oci_core_services.TollNY-Sgw.services[0]["cidr_block"]
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.TollNY-Sgw.id
  }
}

resource "oci_core_drg" "TollNY_Drg" {
  // Required
  compartment_id = var.compartment_ocid

  // Optional
  display_name = "TollnyDRG"
}

resource "oci_core_drg_attachment" "TollNY_Drg_attachment_a" {
  // Required
  drg_id = oci_core_drg.TollNY_Drg.id
  vcn_id = oci_core_vcn.vcn1.id

  // Optional
  #drg_route_table_id = oci_core_drg_route_table.TollNY_Drg_route_table.id

}

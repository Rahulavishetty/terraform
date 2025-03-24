resource "oci_core_drg" "drg" {
  compartment_id = var.compartment_id
  display_name   = "DRG"
}

resource "oci_core_drg_attachment" "hub_drg_attachment" {
  drg_id       = oci_core_drg.drg.id
  vcn_id       = oci_core_vcn.hub_vcn.id
  display_name = "HubDRGAttachment"
}

resource "oci_core_drg_attachment" "spoke_drg_attachment_1" {
  drg_id       = oci_core_drg.drg.id
  vcn_id       = oci_core_vcn.spoke_vcn_1.id
  display_name = "SpokeDRGAttachment1"
}

resource "oci_core_drg_attachment" "spoke_drg_attachment_2" {
  drg_id       = oci_core_drg.drg.id
  vcn_id       = oci_core_vcn.spoke_vcn_2.id
  display_name = "SpokeDRGAttachment2"
}


resource "oci_core_drg_attachment" "spoke_drg_attachment_3" {
  drg_id       = oci_core_drg.drg.id
  vcn_id       = oci_core_vcn.spoke_vcn_3.id
  display_name = "SpokeDRGAttachment3"
}

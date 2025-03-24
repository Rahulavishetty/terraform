output "HubVCNid" {
value = [oci_core_vcn.hub_vcn.id]
}

output "Spoke1VCNid" {
value = [
oci_core_vcn.spoke_vcn_1.id]
}

output "Spoke2VCNid" {
value = [oci_core_vcn.spoke_vcn_2.id]
}

output "Spoke3VCNid" {
value = [oci_core_vcn.spoke_vcn_3.id]
}

output "hubDRGattachment" {
value = [oci_core_drg_attachment.hub_drg_attachment.id]
}

output "spoke1DRGattachment" {
value = oci_core_drg_attachment.spoke_drg_attachment_1.id
}

output "spoke2DRGattachment" {
value = oci_core_drg_attachment.spoke_drg_attachment_2.id
}

output "spoke3DRGattachment" {
value = oci_core_drg_attachment.spoke_drg_attachment_3.id
}

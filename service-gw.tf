data "oci_core_services" "TollNY-Sgw" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

output "services" {
  value = [data.oci_core_services.TollNY-Sgw.services]
}

resource "oci_core_service_gateway" "TollNY-Sgw" {
  #Required
  compartment_id = var.compartment_ocid

  services {
    service_id = data.oci_core_services.TollNY-Sgw.services[0]["id"]
  }

  vcn_id = oci_core_vcn.vcn1.id

  #Optional
  display_name   = "TollNy-SGW"
}

data "oci_core_service_gateways" "TollNY-Sgws" {
  #Required
  compartment_id = var.compartment_ocid

  #Optional
  state  = "AVAILABLE"
  vcn_id = oci_core_vcn.vcn1.id
}

output "service_gateways" {
  value = [data.oci_core_service_gateways.TollNY-Sgws.service_gateways]
}

resource "oci_core_security_list" "hub_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.hub_vcn.id
  display_name   = "HubSecurityList"
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
    icmp_options {
      code = 4
      type = 3
    }
  }


  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "spoke_sl_1" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_1.id
  display_name   = "SpokeSecurityList1"
  ingress_security_rules {
    protocol = "6"
    source   = local.hubsubnet_1
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "1"
    source   = local.hubsubnet_2
    icmp_options {
      code = 4
      type = 3
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "spoke_sl_2" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_2.id
  display_name   = "SpokeSecurityList2"
  ingress_security_rules {
    protocol = "6"
    source   = local.hubsubnet_1
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "1"
    source   = local.hubsubnet_2
    icmp_options {
      code = 4
      type = 3
    }
  }


  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_security_list" "spoke_sl_3" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.spoke_vcn_3.id
  display_name   = "SpokeSecurityList3"
  ingress_security_rules {
    protocol = "6"
    source   = local.hubsubnet_1
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "1"
    source   = local.hubsubnet_2
    icmp_options {
      code = 4
      type = 3
    }
  }


  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

######################### Creating NSGs ##########################
resource "oci_core_network_security_group" "TNY_db_nsg" {
  display_name   = "TNY_db_nsg"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn1.id
}
resource "oci_core_network_security_group_security_rule" "TNY_db_nsg_security_rule_00" {
  description               = "Allowing all egress"
  network_security_group_id = oci_core_network_security_group.TNY_db_nsg.id
  protocol                  = "6"
  direction                 = "EGRESS"
  destination_type          = "CIDR_BLOCK"
  destination               = "0.0.0.0/0"
  stateless                 = false
}
resource "oci_core_network_security_group_security_rule" "TNY_db_nsg_security_rule_01" {
  description               = "Allowing SSH from Bastion host"
  for_each                  = toset(["22"])
  network_security_group_id = oci_core_network_security_group.TNY_db_nsg.id
  protocol                  = "6"
  direction                 = "INGRESS"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"
  stateless                 = false

  tcp_options {
    destination_port_range {
      min = each.key
      max = each.key
    }
  }
}

resource "oci_core_network_security_group_security_rule" "TNY_db_nsg_security_rule_02" {
  description               = "Allowing DB Port from Public Network"
  for_each                  = toset(["1521"])
  network_security_group_id = oci_core_network_security_group.TNY_db_nsg.id
  protocol                  = "6"
  direction                 = "INGRESS"
  source_type               = "CIDR_BLOCK"
  source                    = "0.0.0.0/0"
  stateless                 = false

  tcp_options {
    destination_port_range {
      min = each.key
      max = each.key
    }
  }
}
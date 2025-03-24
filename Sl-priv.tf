resource "oci_core_security_list" "Private-SL-1"{
compartment_id = var.compartment_ocid
display_name = "Private-DB-SL-1"
vcn_id = oci_core_vcn.vcn1.id


    egress_security_rules {
        protocol = "all"
        destination = "0.0.0.0/0"
    }

    ingress_security_rules {
        description = "SSH Access Rule"
        protocol = 6
        source = "0.0.0.0/0"
        tcp_options {
            min = 22
            max = 22
        }
    }



    ingress_security_rules {
        description = "DB Access Rule"
        protocol = 6
        source = "0.0.0.0/0"
        tcp_options {
            min = 1521
            max = 1521
        }
    }


    ingress_security_rules {
        description = "VCN Acess Rule"  
        protocol = 6
        source = "0.0.0.0/0"
        tcp_options {
            min = 5901
            max = 5905
        }
    }
ingress_security_rules {
        description = "VCN Acess Rule2"  
        protocol = 6
        source = "0.0.0.0/0"
        tcp_options {
            min = 6901
            max = 6905
        }
    }
}
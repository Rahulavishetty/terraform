locals {
  hubsubnet_1    = cidrsubnet(var.cidr[0], 2, 1)
  hubsubnet_2    = cidrsubnet(var.cidr[0], 2, 2)
  spoke1subnet_1 = cidrsubnet(var.cidr[1], 2, 1)
  spoke2subnet_1 = cidrsubnet(var.cidr[2], 2, 1)
  spoke3subnet_1 = cidrsubnet(var.cidr[3], 2, 1)
  cidr           = [local.hubsubnet_2, local.spoke1subnet_1, local.spoke2subnet_1, local.spoke3subnet_1]
  vcnId          = [oci_core_vcn.hub_vcn.id, oci_core_vcn.spoke_vcn_1.id, oci_core_vcn.spoke_vcn_2.id, oci_core_vcn.spoke_vcn_3.id]
  #  display_names = ["Hub_Private_Subnet","Spoke1_Private_subnet","Spoke2_Private_Subnet","Spoke3_Private_Subnet"]
  subnets = [
    for i in range(length(local.cidr)) : {
      cidr_block = local.cidr[i]
      vcn_id     = local.vcnId[i]
      #      display_name = local.display_names[i]
    }
  ]
}

output "hubsubnet1" {
  value = local.hubsubnet_1
}

output "hubsubnet2" {
  value = local.hubsubnet_2
}

output "spoke1_subnet1" {
  value = local.spoke1subnet_1
}

output "spoke2_subnet1" {
  value = local.spoke2subnet_1
}

output "spoke3_subnet1" {
  value = local.spoke3subnet_1
}


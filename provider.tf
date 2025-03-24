terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = ###
  user_ocid        = ###
  private_key_path = ###
  fingerprint      = ###
  region           = ###
}


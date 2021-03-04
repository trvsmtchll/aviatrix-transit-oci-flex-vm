terraform {
  required_providers {
    oci = {
      version = "~> 4.2.0"
    }
    aviatrix = {
      source = "aviatrixsystems/aviatrix"
    }
  }
  required_version = ">= 0.13"
}
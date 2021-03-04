# Variables required by the OCI Provider
variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "region" {
}

variable "private_key_path" {
}

variable "compartment_ocid" {
  type    = string
  default = ""
}

//Aviatrix
variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = ""
}

variable "controller_ip" {
  type    = string
  default = ""
}

variable "oci_transit_cidr" {
  default = ""
}

variable "oci_transit_region" {
  default = ""
}

variable "oci_account_name" {
  description = "The name of your OCI Access Account defined in Aviatrix Controller"
  default     = ""
}

variable "ha_enabled" {
  type    = bool
  default = false
}

variable "ssh_public_key" {
  default = ""
}

variable "oci_spokes" {
  description = "Name, cidr, region"
  type = map(object({
    name   = string
    cidr   = string
    region = string
  }))
}

variable "nsg_whitelist_ip" {
  type    = string
  default = ""
}

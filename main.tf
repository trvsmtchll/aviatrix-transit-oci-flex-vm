# OCI Aviatrix Transit
module "oci_transit" {
  source  = "terraform-aviatrix-modules/oci-transit/aviatrix"
  version = "3.0.1"
  name    = "demo"
  cidr    = var.oci_transit_cidr
  ha_gw   = var.ha_enabled
  region  = var.oci_transit_region
  account = var.oci_account_name
}

# OCI Aviatrix Spoke
module "oci_spoke" {
  for_each   = var.oci_spokes
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "3.0.0"
  name       = each.value.name
  cidr       = each.value.cidr
  ha_gw      = var.ha_enabled
  region     = each.value.region
  account    = var.oci_account_name
  transit_gw = module.oci_transit.transit_gateway.gw_name
}

# OCI Network Security Group
module "oci_network_sec_group" {
  for_each         = var.oci_spokes
  source           = "./modules/network-security-groups"
  compartment_ocid = var.compartment_ocid
  nsg_display_name = "${each.value.name}-nsg"
  nsg_whitelist_ip = module.oci_spoke[each.key].vcn.cidr
  vcn_id           = module.oci_spoke[each.key].vcn.vpc_id
  vcn_cidr_block   = module.oci_spoke[each.key].vcn.cidr
}

# OCI Flex Shape Test VM
module "flex_vm" {
  for_each         = var.oci_spokes
  source           = "./modules/flex-compute"
  vcn_id           = module.oci_spoke[each.key].vcn.vpc_id
  subnet_id        = module.oci_spoke[each.key].vcn.subnets[0].subnet_id
  nsg_ids          = [module.oci_network_sec_group[each.key].nsg_id]
  compartment_ocid = var.compartment_ocid
  ssh_public_key   = var.ssh_public_key
  display_name     = "${each.value.name}-avx-test-vm"
  region           = each.value.region
}

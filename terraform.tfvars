// Modify values below as needed

// Aviatrix Controller
#controller_ip = "REPLACE_ME"
#username      = "REPLACE_ME"
#password      = "REPLACE_ME"

# Access Account Name
oci_account_name = "CIS_OCI_Network" # YOUR OCI ACCOUNT NAME IN CONTROLLER

# Aviatrix High Avaialility enabled
ha_enabled = false

# Transit Gateway Network Variables
// Aviatrix Transit
oci_transit_cidr   = "10.2.0.0/18"
oci_transit_region = "us-ashburn-1"

// Aviatrix Spokes
oci_spokes = {
  spoke1 = {
    name   = "demo"
    cidr   = "10.3.0.0/16"
    region = "us-ashburn-1"
  }
}

# OCI Flex VMs
ssh_public_key   = "ssh-rsa AAXXXX...."
compartment_ocid = "ocid1.compartment.oc1..XXXXXXXXX"










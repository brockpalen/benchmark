
################################################
#  Google Cloud options

module "gcp" {
   source = "./gcp"
   gcp_hostname = "gcp-highcpu"
   gcp_cred = "terraform-admin.json"
   gcp_count = 1
   gcp_nodetype = "n1-highcpu-32"
   gcp_user = "brockp"
   gcp_ssh_pub_key = "/home/brockp/.ssh/id_rsa.pub"
}

output "gcp_highcpu_ips" {
   value = "${module.gcp.gcp_public_ips}"
}

## Google Cloud standard CPU version
module "gcp-standard" {
   source = "./gcp"
   gcp_hostname = "gcp-standard"
   gcp_cred = "terraform-admin.json"
   gcp_count = 1
   gcp_nodetype = "n1-standard-32"
   gcp_user = "brockp"
   gcp_ssh_pub_key = "/home/brockp/.ssh/id_rsa.pub"
}

output "gcp_standard_ips" {
   value = "${module.gcp-standard.gcp_public_ips}"
}


################################################
# AWS
################################################
# Microsoft Azure

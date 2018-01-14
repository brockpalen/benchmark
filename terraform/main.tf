
################################################
#  Google Cloud options

module "gcp" {
   source = "./gcp"
   gcp_cred = "terraform-admin.json"
   gcp_count = 1
   gcp_user = "brockp"
   gcp_ssh_pub_key = "/home/brockp/.ssh/id_rsa.pub"
}

output "gcp_ips" {
   value = "${module.gcp.gcp_public_ips}"
}


################################################
# AWS
################################################
# Microsoft Azure

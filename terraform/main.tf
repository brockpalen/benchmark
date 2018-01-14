


module "gcp" {
   source = "./gcp"
   gcp_cred = "terraform-admin.json"
   gcp_count = 2
}

output "gcp_ips" {
   value = "${module.gcp.gcp_public_ips}"
}

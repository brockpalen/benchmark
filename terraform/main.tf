################################################
#  Google Cloud options

## Google standard Sandy Bridge
module "gcp-sandybridge" {
  source          = "./gcp"
  gcp_hostname    = "gcp-highcpu"
  gcp_cred        = "terraform-admin.json"
  gcp_count       = 1
  gcp_nodetype    = "n1-highcpu-32"
  gcp_min_cpu_platform = "Intel Sandy Bridge"
  gcp_user        = "brockp"
  gcp_ssh_pub_key = "/home/brockp/.ssh/id_rsa.pub"
}

output "gcp_sandybridge_ips" {
  value = "${module.gcp-sandybridge.gcp_public_ips}"
}

## Google Cloud broadwell CPU version
module "gcp-broadwell" {
  source          = "./gcp"
  gcp_hostname    = "gcp-broadwell"
  gcp_cred        = "terraform-admin.json"
  gcp_count       = 1
  gcp_nodetype    = "n1-highcpu-32"
  gcp_min_cpu_platform = "Intel Broadwell"
  gcp_user        = "brockp"
  gcp_ssh_pub_key = "/home/brockp/.ssh/id_rsa.pub"
}

output "gcp_broadwell_ips" {
  value = "${module.gcp-broadwell.gcp_public_ips}"
}

## Google Cloud skylake CPUs version
module "gcp-skylake" {
  source               = "./gcp"
  gcp_hostname         = "gcp-skylake"
  gcp_cred             = "terraform-admin.json"
  gcp_count            = 1
  gcp_nodetype         = "n1-standard-32"
  gcp_min_cpu_platform = "Intel Skylake"
  gcp_user             = "brockp"
  gcp_ssh_pub_key      = "/home/brockp/.ssh/id_rsa.pub"
}

output "gcp_skylake_ips" {
  value = "${module.gcp-skylake.gcp_public_ips}"
}

################################################
# AWS
################################################
# Microsoft Azure


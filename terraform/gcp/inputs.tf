###############################################################################
## Google Cloud Options

variable "gcp_cred" {
  description = "Cred secret for GCP API"
}

variable "gcp_region" {
  description = "The region to place the cluster"
  default     = "us-central1"
}

variable "gcp_project" {
  description = "Google Project to invoke under"
  default     = "brockp-terraform-admin"
}

variable "gcp_hostname" {
  description = "Used in compute nodes resource name"
  default     = "gcp"
}

variable "gcp_count" {
  description = "Number of machines to start"
  default     = 1
}

variable "gcp_nodetype" {
  description = "GCP node type defaults n1-standard-1"
  default     = "n1-standard-1"
}

variable "gcp_user" {
  description = "GCP SSH user"
  default     = "brockp"
}

variable "gcp_ssh_pub_key" {
  description = "path to SSH public key"
}

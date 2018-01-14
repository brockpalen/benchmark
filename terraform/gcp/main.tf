provider "google" {
  credentials = "${file("${var.gcp_cred}")}"
  project = "${var.gcp_project}"
  region = "${var.gcp_region}"
}

data "google_compute_zones" "available" {}

resource "google_compute_instance" "gcphost" {
   count = "${var.gcp_count}"
   name = "${var.gcp_hostname}-${count.index}"
   machine_type = "${var.gcp_nodetype}"
   zone = "${data.google_compute_zones.available.names[0]}"
   boot_disk {
         initialize_params {
      image = "centos-7"
   } 
  }

   network_interface {
      network = "default"

      access_config {
        // Ephemeral IP
      }
    }
    
    scheduling {
      preemptible = true
      automatic_restart = false
    }
}

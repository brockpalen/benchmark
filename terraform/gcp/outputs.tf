output "gcp_public_ips" {
   value = "${google_compute_instance.gcphost.*.network_interface.0.access_config.0.assigned_nat_ip}"
}  

output "gcp_cpu" {
  value = "${google_compute_instance.gcphost.*.cpu_platform}"
} 

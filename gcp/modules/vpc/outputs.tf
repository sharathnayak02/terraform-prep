output "vpc_id" {
  value       = google_compute_network.vpc.id
  description = "ID of the VPC network"
}

output "vpc_name" {
  value       = google_compute_network.vpc.name
  description = "Name of the VPC network"
}

output "subnet_id" {
  value       = google_compute_subnetwork.subnetwork.id
  description = "ID of the subnet"
}

output "subnet_cidr" {
  value       = google_compute_subnetwork.subnetwork.ip_cidr_range
  description = "CIDR block for the subnet"
}

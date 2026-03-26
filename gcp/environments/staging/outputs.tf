output "staging_bucket_name" {
  value       = module.staging_bucket.bucket_name
  description = "The name of the GCS bucket created in the staging environment."
}

output "staging_bucket_url" {
  value       = module.staging_bucket.bucket_url
  description = "The URL of the GCS bucket created in the staging environment."
}

output "staging_vpc_id" {
  value       = module.staging_vpc.vpc_id
  description = "The ID of the VPC created in the staging environment."
}

output "staging_vpc_name" {
  value       = module.staging_vpc.vpc_name
  description = "The name of the VPC created in the staging environment."
}

output "staging_subnet_id" {
  value       = module.staging_vpc.subnet_id
  description = "The ID of the subnet created in the staging environment."
}

output "staging_subnet_cidr" {
  value       = module.staging_vpc.subnet_cidr
  description = "The CIDR block of the subnet created in the staging environment."
}

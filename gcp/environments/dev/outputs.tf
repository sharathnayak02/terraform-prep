output "dev_bucket_name" {
  value       = module.dev_bucket.bucket_name
  description = "The name of the GCS bucket created in the dev environment."
}

output "dev_bucket_url" {
  value       = module.dev_bucket.bucket_url
  description = "The URL of the GCS bucket created in the dev environment."
}

output "dev_vpc_id" {
  value       = module.dev_vpc.vpc_id
  description = "The ID of the VPC created in the dev environment."
}

output "dev_vpc_name" {
  value       = module.dev_vpc.vpc_name
  description = "The name of the VPC created in the dev environment."
}

output "dev_subnet_id" {
  value       = module.dev_vpc.subnet_id
  description = "The ID of the subnet created in the dev environment."
}

output "dev_subnet_cidr" {
  value       = module.dev_vpc.subnet_cidr
  description = "The CIDR block of the subnet created in the dev environment."
}

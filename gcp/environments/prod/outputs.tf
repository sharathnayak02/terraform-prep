output "prod_bucket_name" {
  value       = module.prod_bucket.bucket_name
  description = "The name of the GCS bucket created in the prod environment."
}

output "prod_bucket_url" {
  value       = module.prod_bucket.bucket_url
  description = "The URL of the GCS bucket created in the prod environment."
}

output "prod_vpc_id" {
  value       = module.prod_vpc.vpc_id
  description = "The ID of the VPC created in the prod environment."
}

output "prod_vpc_name" {
  value       = module.prod_vpc.vpc_name
  description = "The name of the VPC created in the prod environment."
}

output "prod_subnet_id" {
  value       = module.prod_vpc.subnet_id
  description = "The ID of the subnet created in the prod environment."
}

output "prod_subnet_cidr" {
  value       = module.prod_vpc.subnet_cidr
  description = "The CIDR block of the subnet created in the prod environment."
}

variable "project_id" {
  type        = string
  description = "The ID of the project"
}

variable "region" {
  type        = string
  description = "The region where the VPC will be created"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "environment" {
  type        = string
  description = "Environment label for the VPC (e.g., dev, staging, prod)"
  default     = "dev"
}

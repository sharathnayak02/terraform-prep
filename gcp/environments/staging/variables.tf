variable "bucket_name" {
  type        = string
  description = "Globally unique name for the cloud storage bucket"
}

variable "location" {
  type        = string
  description = "GCP location for the bucket"
  default     = "US"
}

variable "versioning_enabled" {
  type        = bool
  description = "Enable versioning for the bucket"
  default     = false
}

variable "project_id" {
  type        = string
  description = "The ID of the project"
}

variable "region" {
  type        = string
  description = "The region where the VPC will be created"
}

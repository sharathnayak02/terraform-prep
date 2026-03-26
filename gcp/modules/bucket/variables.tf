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

variable "environment" {
  type        = string
  description = "Environment label for the bucket"
  default     = "dev"
}

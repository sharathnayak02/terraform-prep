terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "staging_bucket" {
  source = "../../modules/bucket"

  bucket_name        = var.bucket_name
  location           = var.location
  versioning_enabled = var.versioning_enabled
  environment        = "staging"
}

module "staging_vpc" {
  source = "../../modules/vpc"

  project_id  = var.project_id
  region      = var.region
  vpc_cidr    = "10.0.0.0/16"
  environment = "staging"
}

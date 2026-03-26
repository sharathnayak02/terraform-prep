output "bucket_name" {
  value       = google_storage_bucket.main.name
  description = "The name of the created GCS bucket"
}

output "bucket_url" {
  value       = google_storage_bucket.main.url
  description = "The URL of the created GCS bucket"
}

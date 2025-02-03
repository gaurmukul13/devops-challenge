output "cloud_run_url" {
  description = "The URL of the deployed Cloud Run service"
  value       = google_cloud_run_service.app_service.status[0].url
}

output "api_gateway_url" {
  description = "The API Gateway URL to access the service"
  value       = google_api_gateway_gateway.api_gateway.url
}

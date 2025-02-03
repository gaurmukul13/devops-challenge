resource "google_compute_network" "vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
}

# Public Subnets
resource "google_compute_subnetwork" "public_1" {
  name          = "public-subnet-1"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr_public_1
  project       = var.project_id
  private_ip_google_access = false
}

resource "google_compute_subnetwork" "public_2" {
  name          = "public-subnet-2"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr_public_2
  project       = var.project_id
  private_ip_google_access = false
}

# Private Subnets
resource "google_compute_subnetwork" "private_1" {
  name          = "private-subnet-1"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr_private_1
  project       = var.project_id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "private_2" {
  name          = "private-subnet-2"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr_private_2
  project       = var.project_id
  private_ip_google_access = true
}
resource "google_cloud_run_service" "app_service" {
  name     = "my-cloud-run-service"
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.container_image
        ports {
          container_port = var.container_port
        }
      }
    }
  }

  vpc_access {
    connector = google_vpc_access_connector.private_connector.name
  }
}

resource "google_vpc_access_connector" "private_connector" {
  name   = "private-connector"
  region = var.region
  project = var.project_id

  network = google_compute_network.vpc.name
}

# API Gateway for Cloud Run
resource "google_api_gateway_api" "api" {
  name     = "my-api"
  project  = var.project_id
}

resource "google_api_gateway_api_config" "api_config" {
  api     = google_api_gateway_api.api.name
  project = var.project_id
  config_id = "default"

  gateway_config {
    api = google_api_gateway_api.api.name
    api_url = google_cloud_run_service.app_service.url
  }
}

resource "google_api_gateway_gateway" "api_gateway" {
  api     = google_api_gateway_api.api.name
  api_config = google_api_gateway_api_config.api_config.name
  project = var.project_id
  gateway_id = "my-api-gateway"
  region   = var.region
}

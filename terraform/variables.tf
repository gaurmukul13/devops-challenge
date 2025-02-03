variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "The GCP region for deployment"
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for deployment"
  default     = "us-central1-a"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_public_1" {
  description = "CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_public_2" {
  description = "CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}

variable "subnet_cidr_private_1" {
  description = "CIDR block for the first private subnet"
  default     = "10.0.3.0/24"
}

variable "subnet_cidr_private_2" {
  description = "CIDR block for the second private subnet"
  default     = "10.0.4.0/24"
}

variable "container_image" {
  description = "The container image URL (e.g., Docker Hub or GCR)"
}

variable "container_port" {
  description = "Port that the container will expose"
  default     = 80
}

variable "api_gateway_url" {
  description = "API Gateway URL for triggering the Cloud Run function"
}

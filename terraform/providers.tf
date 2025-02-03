provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google" {
  alias   = "secondary"
  project = var.project_id
  region  = var.region
}

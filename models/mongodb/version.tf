terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.19.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state"
    prefix = "prod"
    credentials = 
  }
}
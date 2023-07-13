terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      version = "4.1.0"
      source  = "hashicorp/google"
    }
  }
}
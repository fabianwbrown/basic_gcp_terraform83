terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  # Configuration options
  region = "us-east-1"
  project = "mentis-negotium"
  zone = "us-east-1b"
  credentials = "mentis-negotium-17998feda7af.json"
}

resource "google_storage_bucket" "bucket1" {
  name          = "mentis_bucket83"
  location      = "us-east-1"
  force_destroy = true

}


resource "google_compute_network" "auto-vpc-83" {
  name = "auto-vpc-83"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg83" {
  name ="sub-sg83"
  network = google_compute_network.auto-vpc-83.id
  ip_cidr_range = "10.72.1.0/24"
  region = "us-east-1"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-83.id
}

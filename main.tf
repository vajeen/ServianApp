variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1"
}

variable "location" {
  default = "us-central1-a"
}

variable "network_name" {
  default = "default"
}

variable "project_id" {
  default = "top-decoder-333608"
}

provider "google" {
  region = var.region
}

resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = var.network_name
  ip_cidr_range            = "10.128.0.0/20"
  network                  = google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = true
}

resource "google_compute_instance" "default" {
  name         = "app1"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "useradd -m -d /home/jenkins jenkins;usermod -a -G sudo jenkins"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_network" "private_network" {
  provider = google-beta

  name = "private-network"
}

variable "region" {
  default = "us-central1"
}

variable "location" {
  default = "us-central1-a"
}

variable "network_name" {
  default = "default"
}

variable "project_id" {
  default = "top-decoder-333608"
}

provider "google" {
  region = var.region
}

resource "google_compute_network" "default" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = var.network_name
  ip_cidr_range            = "10.128.0.0/20"
  network                  = google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = true
}

resource "google_compute_network" "private_network" {
  provider = google-beta

  name = "private-network"
}
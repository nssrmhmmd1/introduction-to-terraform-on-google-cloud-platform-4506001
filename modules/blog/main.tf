resource "google_compute_network" "appnet2" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "appnet2" {
  name          = var.network_name
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.appnet2.id
}

resource "google_compute_instance" "web" {
  name         = var.app_name
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.appnet2.id

    access_config {}
  }
}
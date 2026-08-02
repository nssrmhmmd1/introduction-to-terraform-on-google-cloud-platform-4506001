resource "google_compute_network" "appnet2" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "appnet2" {
  name          = "${var.network_name}-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.appnet2.id
}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = "ubuntu-os-cloud"
  family      = "ubuntu-2204-lts"
}

resource "google_compute_instance" "web" {
  name         = var.app_name
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2

    echo "<h1>${var.app_name}</h1>" > /var/www/html/index.html

    systemctl enable apache2
    systemctl start apache2
  EOT

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
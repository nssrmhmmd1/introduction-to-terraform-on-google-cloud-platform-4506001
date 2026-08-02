resource "google_compute_instance" "web" {
  name         = var.app_name
  machine_type = "e2-micro"

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




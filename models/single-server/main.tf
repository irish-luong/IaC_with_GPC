resource "google_service_account" "default" {
  account_id   = "demo-gce-sa"
  display_name = "Service Account for Demo"
}


resource "google_compute_instance" "default" {
  name         = "demo-terraform-instance"
  machine_type = "e2-medium"
  zone         = "asia-southeast1-a"

  tags = ["http-server", "https-server", "terraform"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }

  metadata = {
    group = "terraform"
  }

  metadata_startup_script = <<-EOF
              #!/bin/bash
              set -e
              apt-get update -y;
              apt-get install -y nginx;
              systemctl status nginx;
              EOF
  
  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }

  allow_stopping_for_update = true

}
provider "google" {
  credentials = "keys.json"
  project     = "terrform-413707"
  region      = "asia-south1"
  zone        = "asia-south1-a"
}

resource "google_compute_instance" "default" {
  count        = 3
  name         = "test-instance-${count.index}"
  machine_type = "e2-medium"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = "new-sibnet"

    access_config {
      // Ephemeral IP
    }
  }
}

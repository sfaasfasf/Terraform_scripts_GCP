#GOOGLE PROVIDE CONNECT TO TERRAFORM
provider "google" {
  credentials = "keys.json"
  project     = "terrform-413707"
  region      = "asia-south1"
  zone        = "asia-south1-a"
}

########SIINGLE INSTACE WITH CUSTOM BOOT DISK AND EXISTING VPC#######

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "e2-medium"
  zone         = "asia-south1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts" // Ubuntu 20.04 LTS
      size  = 100 // 100 GB boot disk
    }
  }

#VPC AND SUBNET#
  network_interface {
    subnetwork = "new-sibnet"

    access_config {
      // Ephemeral IP
    }
  }
}

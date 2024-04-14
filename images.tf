#GOOGLE PROVIDE CONNECT TO TERRAFORM
provider "google" {
  credentials = "keys.json"
  project     = "terrform-413707"
  region      = "asia-south1"
  zone         = "asia-south1-a"
}
#########EXISTING INSTANCE DETAILS WITH NETWORK INTERFACE######
resource "google_compute_instance" "my-instace" {
  name         = "my-instace"
  machine_type = "e2-medium"
  zone         = "asia-south1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts" // Ubuntu 20.04 LTS
      size  = 100 // 100 GB boot disk
    }
  }

#DEFINE VPC AND SUBNET FOR EXISTING INSTACE#
  network_interface {
    subnetwork = "new-sibnet"
  }
}

##DEFINE THE MACHINE IMAGES NAME AND SOURCE DISK NAME### 
resource "google_compute_image" "abu_images" {
  name        = "myssnginx"
  description = "nginx_images"
  source_disk ="my-instance"
  
}






# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "python-vm"
  machine_type = "n2-standard-2"
  zone         = "us-west1-a"
  tags         = ["ssh"]

  #enbles the secure boot
  shielded_instance_config {
    enable_secure_boot          = true
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Install Flask
  metadata_startup_script = join(";",
    [
        "sudo apt-get update",
        "sudo apt-get install -yq build-essential python3-pip git",
        "pip install flask",
        "git clone https://github.com/vitorecomp/python-stack",
        "python3 ./python-stack/python-server/app.py"
    ]
  ) 

  network_interface {
    subnetwork = google_compute_subnetwork.default.id

    # Include this section to give the VM an external IP address
    #access_config {
    #}
  }
}
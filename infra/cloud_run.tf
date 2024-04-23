resource "google_cloud_run_service" "next_server" {
  name     = "next-server"
  location = "us-west1"

  template {
    spec {
      containers {
        image = var.next_image_name
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "node_server" {
  name     = "node-server"
  location = "us-west1"

  template {
    spec {
      containers {
        image = var.node_image_name
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
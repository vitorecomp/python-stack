variable "next_image_name" {
  type    = string
  default = us-west1-docker.pkg.dev/simple-node-terraform/main-app-image-repo/next-server:latest
}

variable "node_image_name" {
  type    = string
  default = us-west1-docker.pkg.dev/simple-node-terraform/main-app-image-repo/node-server:latest
}

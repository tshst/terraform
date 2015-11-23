# Configure the Docker provider
variable "user" {}
variable "passwd" {}

provider "docker" {
    host = "tcp://153.126.155.210:2376/"
    cert_path  = "/Users/t-shuichi/Dropbox/Public/docker_tls"
}

# Create a container
resource "docker_container" "rstudio-server" {
    image = "${docker_image.rstudio-server.latest}"
    name = "rstudio-server"
    env  = ["USER=${var.user}", "PASSWORD=${var.passwd}"]
    ports = {
            internal = 8787
            external = 8787
            }
}

resource "docker_image" "rstudio-server" {
    name = "rocker/rstudio:latest"
}

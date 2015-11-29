# Configure the Docker provider
variable "passwd" {}

provider "docker" {
    host = "tcp://153.126.155.210:2376/"
    cert_path  = "/Users/t-shuichi/Dropbox/Public/docker_tls"
}

# Create a container
resource "docker_container" "ipython-notebook" {
    image = "${docker_image.ipython-notebook.latest}"
    name = "ipython-notebook"
    env  = ["PASSWORD=${var.passwd}", "USE_HTTPS=yes"]
    ports = {
            internal = 8888
            external = 443
            }
    volumes = {
            container_path = "/mnt/uploadfiles"
            host_path = "/home/tshst/uploadfiles"
            }
}

resource "docker_image" "ipython-notebook" {
    name = "jupyter/datascience-notebook"
}

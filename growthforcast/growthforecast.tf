# Configure the Docker provider
provider "docker" {
    host = "tcp://153.126.155.210:2376/"
    cert_path  = "/Users/t-shuichi/Dropbox/Public/docker_tls"
}

# Create a container
resource "docker_container" "gf" {
    image = "${docker_image.gf.latest}"
    name = "gf"
    ports = {
            internal = 5125
            external = 5125
            }
}

resource "docker_image" "gf" {
    name = "kazeburo/growthforecast:latest"
}

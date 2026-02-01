# configure provider
provider "digitalocean" {
  token = var.do_token
}

# create web server
resource "digitalocean_droplet" "web" {
  image = "ubuntu-24-04-x64"
  name = "web-1"
  region = "nyc2"
  size = "s-1vcpu-1gb"
}
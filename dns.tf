# name cheap api credentials
provider "namecheap" {
  user_name = var.nc_username
  api_user = var.nc_api_user
  api_key = var.nc_api_key
  client_ip = var.nc_client_ip
  use_sandbox = false
}

resource "namecheap_domain_records" "adachan-moe" {
  domain = "adachan.moe"
  mode = "MERGE"

  record {
    hostname = "@"
    type = "A"
    address = digitalocean_droplet.web.ipv4_address
  }
}
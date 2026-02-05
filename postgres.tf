# configure provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_database_cluster" "blog-db" {
  name       = "example-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}

resource "digitalocean_database_firewall" "postgres-firewall" {
  cluster_id = digitalocean_database_cluster.blog-db.id

  # allow access from a specific IP address
  rule {
    type = "ip_addr"
    value = digitalocean_droplet.web.ipv4_address
  }
}
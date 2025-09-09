terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "vpn" {
  name      = var.droplet_name
  region    = var.region
  size      = "s-1vcpu-1gb"
  image     = "199332865"
  ssh_keys  = [var.ssh_fingerprint]
  tags      = ["wireguard"]
}

output "vpn_ip" {
  value = digitalocean_droplet.vpn.ipv4_address
}

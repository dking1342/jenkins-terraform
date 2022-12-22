terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  cloud {
    organization = "kavooce1"

    workspaces {
      name = "jenkins-pipeline-01"
    }
  }
}

variable "ssh_key" {
  default = "ssh_key"
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  count  = 2
  image  = "ubuntu-18-04-x64"
  name   = "web-${count.index}"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    data.digitalocean_ssh_key.do_key_01.id
  ]

}

terraform {
	required_providers {
		proxmox = {
			source  = "bpg/proxmox"
			version = "0.78.2"
		}
		cloudflare = {
			source  = "cloudflare/cloudflare"
			version = "~> 5"
		}
  }
}

provider "proxmox" {
	# alias = "kitty"
	endpoint = "https://kitty.mousses.xyz:8006/api2/json"
	api_token = var.proxmox_kitty_api_token_pair
	# self-signed TLS certificate is in use
	insecure = true
}

provider "proxmox" {
	alias = "tower"
	endpoint = "https://tower.mousses.xyz:8006/api2/json"
	api_token = var.proxmox_tower_api_token_pair
	# self-signed TLS certificate is in use
	insecure = true
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
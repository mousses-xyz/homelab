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
	# alias = "primary"
	endpoint = local.proxmox_primary_node_api_url
	api_token = var.proxmox_primary_node_api_token
	# self-signed TLS certificate is in use
	insecure = true
}

provider "proxmox" {
	alias = "secondary"
	endpoint = local.proxmox_secondary_node_api_url
	api_token = var.proxmox_secondary_node_api_token
	# self-signed TLS certificate is in use
	insecure = true
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
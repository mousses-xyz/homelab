terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://tower.mousses.xyz:8006/api2/json"
  pm_api_token_id = "tofu@pam!opentou"
  pm_api_token_secret = var.proxmox_tower_api_token_secret
  pm_tls_insecure = true
}
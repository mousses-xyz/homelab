variable "proxmox_tower_api_token_secret" {
  type      = string
  sensitive = true
  description = "The secret for the Proxmox API token."
}
variable "proxmox_kitty_api_token_pair" {
	type = string
	sensitive = true
	description = "The kitty Proxmox API token."
}
variable "proxmox_tower_api_token_pair" {
	type = string
	sensitive = true
	description = "The tower Proxmox API token."
}
variable "cloudflare_api_token" {
	type = string
	sensitive = true
	description = "Cloudflare API token"
}
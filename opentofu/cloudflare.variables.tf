variable "cloudflare_account_id" {
	type = string
	sensitive = true
	description = "Cloudflare accound ID"
	
}
variable "cloudflare_api_token" {
	type = string
	sensitive = true
	description = "Cloudflare API token"
}
variable "cloudflare_zone_id" {
	type = string
	sensitive = true
	description = "Zone ID for my domain"
}

variable "cloudflare_dns_bluesky_vps_ipv4" {
	type = string
	sensitive = true
	description = "IPv4 Address for my Bluesky VPS"
}
variable "cloudflare_dns_minecraft_ipv4" {
	type = string
	sensitive = true
	description = "IPv4 Address pointing to Minecraft server VM"
}
variable "testing_cname" {
	type = string
	sensitive = false
}
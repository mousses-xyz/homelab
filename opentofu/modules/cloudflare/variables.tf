variable "cloudflare_account_id" {
	type = string
	sensitive = true
	description = "Cloudflare accound ID."
	
}
variable "cloudflare_api_token" {
	type = string
	sensitive = true
	description = "Cloudflare API token."
}
variable "cloudflare_zone_id" {
	type = string
	sensitive = true
	description = "Zone ID for my domain."
}

variable "cloudflare_tunnel_name" {
	type = string
	sensitive = true
	description = "Cloudflare tunnel name."
}
variable "cloudflare_tunnel_id" {
	type = string
	sensitive = true
	description = "Cloudflare tunnel ID."
}
variable "cloudflare_tunnel_secret" {
	type = string
	sensitive = true
	description = "Cloudflare tunnel secret."
}

variable "cloudflare_access_team_name" {
	type = string
	sensitive = true
	description = "Cloudflare Access team name."
}
variable "cloudflare_access_family_group_id" {
	type = string
	sensitive = true
	description = "Family Cloudflare Access Group ID."
}
variable "cloudflare_access_semi_open_group_id" {
	type = string
	sensitive = true
	description = "Semi-open Cloudflare Access Group ID."
}

variable "cloudflare_dns_bluesky_vps_ipv4" {
	type = string
	sensitive = true
	description = "IPv4 Address for my Bluesky VPS."
}
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

variable "github_pages_subdomains" {
  type = set(string)
  default = ["peter"]
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

variable "domain_name" {
	type = string
	description = "Registered domain name to use for hosts, services, proxies, etc."
}

variable "lab_ipv4_address" {
	type = string
	description = "Public IPv4 address of lab"
}

variable "udr7_wan_1" {
	type = string
	description = "UDR7 WAN1 IPv6 address. Not used for service DNS records."
}

variable "bluesky_public_ipv6" {
	type = string
	description = "Global IPv6 address of the Bluesky PDS."
}

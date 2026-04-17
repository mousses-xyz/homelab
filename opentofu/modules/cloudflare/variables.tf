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

variable "domain_name" {
	type = string
	description = "Registered domain name to use for hosts, services, proxies, etc."
}

variable "lab_ipv4_address" {
	type = string
	description = "Public IPv4 address of lab"
}

variable "lab_ipv6_prefix" {
	type = string
	description = "Public IPv6 prefix for lab"
}

variable "lan_ipv4_prefix" {
	type = string
	description = "LAN IPv4 prefix"
}

variable "lab_ipv6_prefix_size" {
	type = string
	description = "Public IPv6 prefix size for lab"
}
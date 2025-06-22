variable "cloudflare_api_token" {
	type = string
	sensitive = true
	description = "Cloudflare API token"
}
variable "bluesky_vps_ipv4" {
	type = string
	sensitive = true
	description = "IPv4 Address for my Bluesky VPS"
}
variable "testing_cname" {
	type = string
	sensitive = false
}
resource "cloudflare_dns_record" "bluesky_vps_root_ipv4" {
	zone_id = var.cloudflare_zone_id
	name = "bluesky.${var.domain_name}"
	type = "A"
	comment = "Bluesky VPS root DNS record IPv4."
	content = var.cloudflare_dns_bluesky_vps_ipv4
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "bluesky_vps_wildcard_ipv4" {
	zone_id = var.cloudflare_zone_id
	name = "*.bluesky.${var.domain_name}"
	type = "A"
	comment = "Bluesky VPS wildcard DNS record IPv4."
	content = var.cloudflare_dns_bluesky_vps_ipv4
	proxied = false
	ttl = 1
}

resource "cloudflare_dns_record" "minecraft_root_ipv4" {
	zone_id = var.cloudflare_zone_id
	name = "minecraft.${var.domain_name}"
	type = "A"
	comment = "Minecraft server root DNS record IPv4."
	content = var.lab_ipv4_address
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "minecraft_wildcard_ipv4" {
	zone_id = var.cloudflare_zone_id
	name = "*.minecraft.${var.domain_name}"
	type = "A"
	comment = "Minecraft server wildcard DNS record IPv4."
	content = var.lab_ipv4_address
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "minecraft_root_ipv6" {
	zone_id = var.cloudflare_zone_id
	name = "minecraft.${var.domain_name}"
	type = "AAAA"
	comment = "Minecraft server root DNS record IPv6."
	content = var.lab_ipv6_prefix
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "minecraft_wildcard_ipv6" {
	zone_id = var.cloudflare_zone_id
	name = "*.minecraft.${var.domain_name}"
	type = "AAAA"
	comment = "Minecraft server wildcard DNS record IPv6."
	content = var.lab_ipv6_prefix
	proxied = false
	ttl = 1
}
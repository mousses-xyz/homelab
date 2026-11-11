resource "cloudflare_dns_record" "bluesky_vps_root_ipv4" {
	zone_id = var.cloudflare_zone_id
	name = "bluesky.${var.domain_name}"
	type = "A"
	comment = "Bluesky VM root DNS record IPv4."
	content = var.lab_ipv4_address
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "bluesky_vps_wildcard_ipv4" {
	zone_id = var.cloudflare_zone_id
	name = "*.bluesky.${var.domain_name}"
	type = "A"
	comment = "Bluesky VM wildcard DNS record IPv4."
	content = var.lab_ipv4_address
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "bluesky_vps_root_ipv6" {
	zone_id = var.cloudflare_zone_id
	name = "bluesky.${var.domain_name}"
	type = "AAAA"
	comment = "Bluesky VM root DNS record IPv6."
	content = var.lab_ipv6_prefix
	proxied = false
	ttl = 1
}
resource "cloudflare_dns_record" "bluesky_vps_wildcard_ipv6" {
	zone_id = var.cloudflare_zone_id
	name = "*.bluesky.${var.domain_name}"
	type = "AAAA"
	comment = "Bluesky VM wildcard DNS record IPv6."
	content = var.lab_ipv6_prefix
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

# Cloudflare Tunnel CNAME records
resource "cloudflare_dns_record" "tunnel_nas" {
	zone_id = var.cloudflare_zone_id
	name = "nas"
	type = "CNAME"
	comment = "NAS via Cloudflare Tunnel"
	content = "${var.cloudflare_tunnel_id}.cfargotunnel.com"
	proxied = true
	ttl = 1
}

resource "cloudflare_dns_record" "tunnel_wiki" {
	zone_id = var.cloudflare_zone_id
	name = "wiki"
	type = "CNAME"
	comment = "Wiki via Cloudflare Tunnel"
	content = "${var.cloudflare_tunnel_id}.cfargotunnel.com"
	proxied = true
	ttl = 1
}

resource "cloudflare_dns_record" "tunnel_map" {
	zone_id = var.cloudflare_zone_id
	name = "map"
	type = "CNAME"
	comment = "Minecraft map via Cloudflare Tunnel"
	content = "${var.cloudflare_tunnel_id}.cfargotunnel.com"
	proxied = true
	ttl = 1
}

resource "cloudflare_dns_record" "tunnel_jellyfin" {
	zone_id = var.cloudflare_zone_id
	name = "jellyfin"
	type = "CNAME"
	comment = "Jellyfin via Cloudflare Tunnel"
	content = "${var.cloudflare_tunnel_id}.cfargotunnel.com"
	proxied = true
	ttl = 1
}

resource "cloudflare_dns_record" "tunnel_homeassistant" {
	zone_id = var.cloudflare_zone_id
	name = "homeassistant"
	type = "CNAME"
	comment = "Home Assistant via Cloudflare Tunnel"
	content = "${var.cloudflare_tunnel_id}.cfargotunnel.com"
	proxied = true
	ttl = 1
}

# GitHub Pages
# The root and www records point at the GitHub Pages org hostname. GitHub
# routes requests by Host header, so mousses.xyz serves the website-root site
# and peter.mousses.xyz serves the peter site. Cloudflare flattens the apex
# CNAME automatically.
resource "cloudflare_dns_record" "github_pages" {
  for_each = var.github_pages_subdomains
	zone_id = var.cloudflare_zone_id
	name = each.value
	type = "CNAME"
  comment = "GitHub Pages site: ${each.value}.${var.domain_name}"
	content = "mousses-xyz.github.io"
	proxied = false
	ttl = 1
}

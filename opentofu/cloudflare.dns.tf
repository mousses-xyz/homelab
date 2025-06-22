resource "cloudflare_dns_record" "bluesky_vps_root" {
  zone_id = var.cloudflare_zone_id
  name = "bluesky"
  type = "A"
  comment = "Bluesky VPS root DNS record"
  content = var.bluesky_vps_ipv4
  proxied = false
  ttl = 1
}
resource "cloudflare_dns_record" "bluesky_vps_wildcard" {
  zone_id = var.cloudflare_zone_id
  name = "*.bluesky"
  type = "A"
  comment = "Bluesky VPS wildcard DNS record"
  content = var.bluesky_vps_ipv4
  proxied = false
  ttl = 1
}

resource "cloudflare_dns_record" "minecraft_root" {
  zone_id = var.cloudflare_zone_id
  name = "minecraft"
  type = "A"
  comment = "Minecraft server root DNS record"
  content = var.bluesky_vps_ipv4
  proxied = false
  ttl = 1
}
resource "cloudflare_dns_record" "minecraft_wildcard" {
  zone_id = var.cloudflare_zone_id
  name = "*.minecraft"
  type = "A"
  comment = "Minecraft server wildcard DNS record"
  content = var.bluesky_vps_ipv4
  proxied = false
  ttl = 1
}

resource "cloudflare_dns_record" "test" {
  zone_id = var.cloudflare_zone_id
  name = "test"
  type = "CNAME"
  comment = "Testing OpenTofu"
  content = var.testing_cname
  proxied = false
  ttl = 1
}
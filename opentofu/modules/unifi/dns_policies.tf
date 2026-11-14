# DNS policies (A records).

# DNS A record: *.tower.mousses.xyz -> 10.9.20.7.
resource "unifi_dns_policy" "dns_wildcard_tower_mousses_xyz" {
  domain             = "*.tower.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.7"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: router.mousses.xyz -> 10.9.20.1.
resource "unifi_dns_policy" "dns_router_mousses_xyz" {
  domain             = "router.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.1"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.local.mousses.xyz -> 10.9.20.2.
resource "unifi_dns_policy" "dns_wildcard_local_mousses_xyz" {
  domain             = "*.local.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.2"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.pds.mousses.xyz -> 10.9.20.12.
resource "unifi_dns_policy" "dns_wildcard_pds_mousses_xyz" {
  domain             = "*.pds.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.12"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: bluesky.mousses.xyz -> 10.9.20.12.
resource "unifi_dns_policy" "dns_bluesky_mousses_xyz" {
  domain             = "bluesky.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.12"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.bluesky.mousses.xyz -> 10.9.20.12.
resource "unifi_dns_policy" "dns_wildcard_bluesky_mousses_xyz" {
  domain             = "*.bluesky.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.12"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.redqueen.mousses.xyz -> 10.9.20.242.
resource "unifi_dns_policy" "dns_wildcard_redqueen_mousses_xyz" {
  domain             = "*.redqueen.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.242"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.omv.mousses.xyz -> 10.9.20.14.
resource "unifi_dns_policy" "dns_wildcard_omv_mousses_xyz" {
  domain             = "*.omv.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.14"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: minecraft.mousses.xyz -> 10.9.20.14.
resource "unifi_dns_policy" "dns_minecraft_mousses_xyz" {
  domain             = "minecraft.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.14"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: redqueen.mousses.xyz -> 10.9.20.242.
resource "unifi_dns_policy" "dns_redqueen_mousses_xyz" {
  domain             = "redqueen.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.242"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: local.mousses.xyz -> 10.9.20.2.
resource "unifi_dns_policy" "dns_local_mousses_xyz" {
  domain             = "local.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.2"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.nas.mousses.xyz -> 10.9.20.2.
resource "unifi_dns_policy" "dns_wildcard_nas_mousses_xyz" {
  domain             = "*.nas.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.2"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# DNS A record: *.minecraft.mousses.xyz -> 10.9.20.14.
resource "unifi_dns_policy" "dns_wildcard_minecraft_mousses_xyz" {
  domain             = "*.minecraft.mousses.xyz"
  enabled            = true
  ip_address         = null
  ipv4_address       = "10.9.20.14"
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# Local DNS A records for devices with a static IPv4 DHCP reservation.
#
# Names already defined in UniFi's built-in local DNS (dns, homeassistant,
# kitty, nas, omv, pds, switch, tower) are intentionally omitted: the
# controller rejects explicit DNS policies that overlap with them.
locals {
  pds_ula = "fd00:beef:cafe:1:be24:11ff:febb:f8d5"

  static_device_dns = {
    teslacam      = "10.9.20.8"
    aqara-hub     = "10.12.10.146"
    minecraft-vm  = "10.9.20.11"
    whale-pi      = "10.9.20.10"
    gl-inet       = "10.9.20.9"
    thesis        = "10.9.20.50"
    anker-dock    = "10.9.20.6"
    canon-printer = "10.12.10.2"
    claude-1      = "10.7.27.6"
  }
}

resource "unifi_dns_policy" "static_device" {
  for_each = local.static_device_dns

  domain             = "${each.key}.${var.domain_name}"
  enabled            = true
  ip_address         = null
  ipv4_address       = each.value
  ipv6_address       = null
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "A_RECORD"
  weight             = null
}

# Local DNS AAAA: bluesky.mousses.xyz -> PDS ULA.
resource "unifi_dns_policy" "dns_bluesky_mousses_xyz_ipv6" {
  domain             = "bluesky.${var.domain_name}"
  enabled            = true
  ip_address         = null
  ipv4_address       = null
  ipv6_address       = local.pds_ula
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "AAAA_RECORD"
  weight             = null
}

# Local DNS AAAA: *.bluesky.mousses.xyz -> PDS ULA.
resource "unifi_dns_policy" "dns_wildcard_bluesky_mousses_xyz_ipv6" {
  domain             = "*.bluesky.${var.domain_name}"
  enabled            = true
  ip_address         = null
  ipv4_address       = null
  ipv6_address       = local.pds_ula
  mail_server_domain = null
  port               = null
  priority           = null
  protocol           = null
  server_domain      = null
  service            = null
  site_id            = data.unifi_site.main.id
  target_domain      = null
  text               = null
  ttl_seconds        = 0
  type               = "AAAA_RECORD"
  weight             = null
}

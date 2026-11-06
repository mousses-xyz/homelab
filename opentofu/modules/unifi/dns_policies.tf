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

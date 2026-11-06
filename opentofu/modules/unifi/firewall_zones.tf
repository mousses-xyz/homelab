# Built-in UniFi firewall zones are read-only, so they are referenced as data sources rather than managed.

data "unifi_firewall_zone" "internal" {
  site_id = data.unifi_site.main.id
  name    = "Internal"
}

data "unifi_firewall_zone" "hotspot" {
  site_id = data.unifi_site.main.id
  name    = "Hotspot"
}

data "unifi_firewall_zone" "vpn" {
  site_id = data.unifi_site.main.id
  name    = "Vpn"
}

data "unifi_firewall_zone" "dmz" {
  site_id = data.unifi_site.main.id
  name    = "Dmz"
}

data "unifi_firewall_zone" "external" {
  site_id = data.unifi_site.main.id
  name    = "External"
}

data "unifi_firewall_zone" "gateway" {
  site_id = data.unifi_site.main.id
  name    = "Gateway"
}

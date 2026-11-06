# Built-in UniFi firewall zones are read-only, so they are referenced as data sources rather than managed.

# Built-in Internal zone (trusted LAN, IoT, Guest, and AI networks).
data "unifi_firewall_zone" "internal" {
  site_id = data.unifi_site.main.id
  name    = "Internal"
}

# Built-in Hotspot zone.
data "unifi_firewall_zone" "hotspot" {
  site_id = data.unifi_site.main.id
  name    = "Hotspot"
}

# Built-in VPN zone.
data "unifi_firewall_zone" "vpn" {
  site_id = data.unifi_site.main.id
  name    = "Vpn"
}

# Built-in DMZ zone.
data "unifi_firewall_zone" "dmz" {
  site_id = data.unifi_site.main.id
  name    = "Dmz"
}

# Built-in External zone (WAN interfaces).
data "unifi_firewall_zone" "external" {
  site_id = data.unifi_site.main.id
  name    = "External"
}

# Built-in Gateway zone.
data "unifi_firewall_zone" "gateway" {
  site_id = data.unifi_site.main.id
  name    = "Gateway"
}

# Reusable traffic matching lists.

resource "unifi_traffic_matching_list" "iot_trusted" {
  ipv4_addresses = ["10.12.10.3", "10.12.10.4", "10.12.10.5"]
  ipv6_addresses = null
  name           = "IoT trusted"
  ports          = null
  site_id        = data.unifi_site.main.id
  type           = "IPV4_ADDRESSES"
}

resource "unifi_traffic_matching_list" "https" {
  ipv4_addresses = null
  ipv6_addresses = null
  name           = "HTTPS"
  ports          = ["443"]
  site_id        = data.unifi_site.main.id
  type           = "PORTS"
}

resource "unifi_traffic_matching_list" "minecraft_bedrock" {
  ipv4_addresses = null
  ipv6_addresses = null
  name           = "Minecraft Bedrock"
  ports          = ["19132"]
  site_id        = data.unifi_site.main.id
  type           = "PORTS"
}

resource "unifi_traffic_matching_list" "minecraft_java" {
  ipv4_addresses = null
  ipv6_addresses = null
  name           = "Minecraft Java"
  ports          = ["25565"]
  site_id        = data.unifi_site.main.id
  type           = "PORTS"
}

resource "unifi_traffic_matching_list" "minecraft_host" {
  ipv4_addresses = ["10.9.20.14"]
  ipv6_addresses = null
  name           = "Minecraft Host"
  ports          = null
  site_id        = data.unifi_site.main.id
  type           = "IPV4_ADDRESSES"
}

resource "unifi_traffic_matching_list" "http" {
  ipv4_addresses = null
  ipv6_addresses = null
  name           = "HTTP"
  ports          = ["80"]
  site_id        = data.unifi_site.main.id
  type           = "PORTS"
}

resource "unifi_traffic_matching_list" "atproto_pds" {
  ipv4_addresses = ["10.9.20.12"]
  ipv6_addresses = null
  name           = "ATProto PDS"
  ports          = null
  site_id        = data.unifi_site.main.id
  type           = "IPV4_ADDRESSES"
}

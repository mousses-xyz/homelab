# Port forwards managed via the legacy local Network API.
# The "Bluesky" rule uses pfwd_interface="all", which this provider cannot represent; left unmanaged.

resource "unifi_port_forward" "minecraft_java" {
  destination_port = "25565"
  enabled          = true
  forward_ip       = "10.9.20.14"
  forward_port     = "25565"
  logging_enabled  = false
  name             = "Minecraft Java"
  protocol         = "tcp"
  site_id          = data.unifi_site.main.id
  source           = "any"
  wan_interface    = "wan"
}

resource "unifi_port_forward" "minecraft_bedrock" {
  destination_port = "19132"
  enabled          = true
  forward_ip       = "10.9.20.14"
  forward_port     = "19132"
  logging_enabled  = false
  name             = "Minecraft Bedrock"
  protocol         = "udp"
  site_id          = data.unifi_site.main.id
  source           = "any"
  wan_interface    = "wan"
}

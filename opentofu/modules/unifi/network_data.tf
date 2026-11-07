# The default LAN network is system-defined. The provider cannot round-trip its
# dhcp_guarding object, so reference it as a data source instead of managing it.
# Default LAN network (system-defined; referenced read-only).
data "unifi_network" "lan" {
  site_id = data.unifi_site.main.id
  name    = "LAN"
}

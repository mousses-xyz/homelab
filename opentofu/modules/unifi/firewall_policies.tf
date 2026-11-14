# User-defined firewall policies only. UniFi system/derived policies are not managed.

# Allow LAN clients to reach IoT trusted services.
resource "unifi_firewall_policy" "home_assistant_comms_2" {
  action                  = "ALLOW"
  allow_return_traffic    = true
  connection_state_filter = null
  description             = "Allow LAN clients to reach IoT trusted services"
  destination_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = false
    ip_address_traffic_matching_list_id = unifi_traffic_matching_list.iot_trusted.id
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = null
    network_match_opposite              = null
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "IP_ADDRESS"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  destination_zone_id = data.unifi_firewall_zone.internal.id
  enabled             = true
  ip_version          = "IPV4_AND_IPV6"
  ipsec_filter        = null
  logging_enabled     = false
  name                = "Home Assistant Comms 2"
  protocol_filter     = null
  schedule            = null
  site_id             = data.unifi_site.main.id
  source_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = [data.unifi_network.lan.id]
    network_match_opposite              = false
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "NETWORK"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  source_zone_id = data.unifi_firewall_zone.internal.id
}

# Allow the Home Assistant Pi to reach the LAN.
resource "unifi_firewall_policy" "home_assistant_comms" {
  action                  = "ALLOW"
  allow_return_traffic    = true
  connection_state_filter = null
  description             = "Allow the Home Assistant Pi to reach the LAN"
  destination_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = [data.unifi_network.lan.id]
    network_match_opposite              = false
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "NETWORK"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  destination_zone_id = data.unifi_firewall_zone.internal.id
  enabled             = true
  ip_version          = "IPV4_AND_IPV6"
  ipsec_filter        = null
  logging_enabled     = false
  name                = "Home Assistant Comms"
  protocol_filter     = null
  schedule            = null
  site_id             = data.unifi_site.main.id
  source_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = ["d8:3a:dd:ad:78:ea"]
    network_ids                         = null
    network_match_opposite              = null
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "MAC_ADDRESS"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  source_zone_id = data.unifi_firewall_zone.internal.id
}

# Allow LAN clients to reach the AI network.
resource "unifi_firewall_policy" "talk_to_claude" {
  action                  = "ALLOW"
  allow_return_traffic    = true
  connection_state_filter = null
  description             = "Allow LAN clients to reach the AI network"
  destination_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = [unifi_network.ai.id]
    network_match_opposite              = false
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "NETWORK"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  destination_zone_id = data.unifi_firewall_zone.internal.id
  enabled             = true
  ip_version          = "IPV4_AND_IPV6"
  ipsec_filter        = null
  logging_enabled     = false
  name                = "Talk to Claude"
  protocol_filter     = null
  schedule            = null
  site_id             = data.unifi_site.main.id
  source_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = [data.unifi_network.lan.id]
    network_match_opposite              = false
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "NETWORK"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  source_zone_id = data.unifi_firewall_zone.internal.id
}

# Allow Home Assistant Pi WAN traffic for established/related connections.
resource "unifi_firewall_policy" "home_assistant_wan" {
  action                  = "ALLOW"
  allow_return_traffic    = false
  connection_state_filter = ["ESTABLISHED", "RELATED"]
  description             = "Allow Home Assistant Pi WAN traffic (established/related)"
  destination_filter      = null
  destination_zone_id     = data.unifi_firewall_zone.external.id
  enabled                 = true
  ip_version              = "IPV4_AND_IPV6"
  ipsec_filter            = null
  logging_enabled         = false
  name                    = "Home Assistant WAN"
  protocol_filter         = null
  schedule                = null
  site_id                 = data.unifi_site.main.id
  source_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = ["d8:3a:dd:ad:78:ea"]
    network_ids                         = null
    network_match_opposite              = null
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "MAC_ADDRESS"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  source_zone_id = data.unifi_firewall_zone.internal.id
}

# Allow the Matter Hub outbound to WAN.
resource "unifi_firewall_policy" "matter_hub" {
  action                  = "ALLOW"
  allow_return_traffic    = false
  connection_state_filter = null
  description             = "Allow the Matter Hub outbound to WAN"
  destination_filter      = null
  destination_zone_id     = data.unifi_firewall_zone.external.id
  enabled                 = true
  ip_version              = "IPV4_AND_IPV6"
  ipsec_filter            = null
  logging_enabled         = false
  name                    = "Matter Hub"
  protocol_filter         = null
  schedule                = null
  site_id                 = data.unifi_site.main.id
  source_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = ["54:ef:44:a3:76:15"]
    network_ids                         = null
    network_match_opposite              = null
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "MAC_ADDRESS"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  source_zone_id = data.unifi_firewall_zone.internal.id
}

# Allow AI network clients to reach Red Queen.
resource "unifi_firewall_policy" "claude_to_red_queen" {
  action                  = "ALLOW"
  allow_return_traffic    = true
  connection_state_filter = null
  description             = "Allow AI network clients to reach Red Queen"
  destination_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = false
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = ["10.9.20.242"]
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = null
    network_match_opposite              = null
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "IP_ADDRESS"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  destination_zone_id = data.unifi_firewall_zone.internal.id
  enabled             = true
  ip_version          = "IPV4_AND_IPV6"
  ipsec_filter        = null
  logging_enabled     = false
  name                = "Claude to Red Queen"
  protocol_filter     = null
  schedule            = null
  site_id             = data.unifi_site.main.id
  source_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = null
    ipv6_iid_match_opposite             = null
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = [unifi_network.ai.id]
    network_match_opposite              = false
    port_filter                         = null
    region_codes                        = null
    site_to_site_vpn_tunnel_id          = null
    type                                = "NETWORK"
    vpn_server_ids                      = null
    vpn_server_match_opposite           = null
  }
  source_zone_id = data.unifi_firewall_zone.internal.id
}

# Allow external IPv6 clients to reach the Bluesky PDS on TCP 80/443.
# Matching on the IID (address plus low-64-bit mask) keeps the rule valid when
# the delegated prefix changes.
resource "unifi_firewall_policy" "bluesky_ipv6" {
  action                  = "ALLOW"
  allow_return_traffic    = true
  connection_state_filter = null
  description             = "Allow external IPv6 clients to reach the Bluesky PDS"
  destination_filter = {
    application_category_ids            = null
    application_ids                     = null
    domains                             = null
    ip_address_match_opposite           = null
    ip_address_traffic_matching_list_id = null
    ip_addresses                        = null
    ipv6_iid                            = "::be24:11ff:febb:f8d5/::ffff:ffff:ffff:ffff"
    ipv6_iid_match_opposite             = false
    mac_address                         = null
    mac_addresses                       = null
    network_ids                         = null
    network_match_opposite              = null
    port_filter = {
      match_opposite           = false
      ports                    = ["80", "443"]
      traffic_matching_list_id = null
      type                     = "PORTS"
    }
    region_codes               = null
    site_to_site_vpn_tunnel_id = null
    type                       = "IPV6_IID"
    vpn_server_ids             = null
    vpn_server_match_opposite  = null
  }
  destination_zone_id = data.unifi_firewall_zone.internal.id
  enabled             = true
  ip_version          = "IPV6"
  ipsec_filter        = null
  logging_enabled     = false
  name                = "Bluesky IPv6"
  protocol_filter = {
    match_opposite  = null
    named_protocol  = null
    preset_name     = "TCP_UDP"
    protocol_number = null
    type            = "PRESET"
  }
  schedule       = null
  site_id        = data.unifi_site.main.id
  source_filter  = null
  source_zone_id = data.unifi_firewall_zone.external.id
}

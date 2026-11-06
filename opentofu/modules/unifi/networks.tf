# Networks managed through the UniFi Integration API.

# AI workload VLAN (VLAN 4, 10.7.27.0/24).
resource "unifi_network" "ai" {
  cellular_backup_enabled = true
  device_id               = null
  dhcp_guarding           = null
  enabled                 = true
  internet_access_enabled = true
  ipv4_configuration = {
    additional_host_ip_subnets = null
    auto_scale_enabled         = true
    dhcp_configuration = {
      dhcp_server_ip_addresses        = null
      dns_server_ip_addresses         = null
      domain_name                     = ""
      end_ip_address                  = "10.7.27.254"
      gateway_ip_address_override     = null
      lease_time_seconds              = 86400
      mode                            = "SERVER"
      ping_conflict_detection_enabled = true
      start_ip_address                = "10.7.27.6"
    }
    host_ip_address = "10.7.27.1"
    prefix_length   = 24
  }
  isolation_enabled       = true
  management              = "GATEWAY"
  mdns_forwarding_enabled = false
  name                    = "AI"
  site_id                 = data.unifi_site.main.id
  vlan_id                 = 4
  zone_id                 = data.unifi_firewall_zone.internal.id
}

# IoT VLAN (VLAN 2, 10.12.10.0/24).
resource "unifi_network" "iot" {
  cellular_backup_enabled = true
  device_id               = null
  dhcp_guarding           = null
  enabled                 = true
  internet_access_enabled = true
  ipv4_configuration = {
    additional_host_ip_subnets = null
    auto_scale_enabled         = true
    dhcp_configuration = {
      dhcp_server_ip_addresses        = null
      dns_server_ip_addresses         = null
      domain_name                     = ""
      end_ip_address                  = "10.12.10.254"
      gateway_ip_address_override     = null
      lease_time_seconds              = 86400
      mode                            = "SERVER"
      ping_conflict_detection_enabled = true
      start_ip_address                = "10.12.10.6"
    }
    host_ip_address = "10.12.10.1"
    prefix_length   = 24
  }
  isolation_enabled       = true
  management              = "GATEWAY"
  mdns_forwarding_enabled = true
  name                    = "IoT"
  site_id                 = data.unifi_site.main.id
  vlan_id                 = 2
  zone_id                 = data.unifi_firewall_zone.internal.id
}

# Guest VLAN (VLAN 3, 10.9.18.0/24).
resource "unifi_network" "guest" {
  cellular_backup_enabled = true
  device_id               = null
  dhcp_guarding           = null
  enabled                 = true
  internet_access_enabled = true
  ipv4_configuration = {
    additional_host_ip_subnets = null
    auto_scale_enabled         = true
    dhcp_configuration = {
      dhcp_server_ip_addresses        = null
      dns_server_ip_addresses         = null
      domain_name                     = ""
      end_ip_address                  = "10.9.18.254"
      gateway_ip_address_override     = null
      lease_time_seconds              = 86400
      mode                            = "SERVER"
      ping_conflict_detection_enabled = true
      start_ip_address                = "10.9.18.6"
    }
    host_ip_address = "10.9.18.1"
    prefix_length   = 24
  }
  isolation_enabled       = true
  management              = "GATEWAY"
  mdns_forwarding_enabled = false
  name                    = "Guest"
  site_id                 = data.unifi_site.main.id
  vlan_id                 = 3
  zone_id                 = data.unifi_firewall_zone.internal.id
}

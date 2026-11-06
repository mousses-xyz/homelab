# WiFi broadcasts. Passphrases are supplied via gitignored auto.tfvars.

resource "unifi_wifi_broadcast" "fbi_van_3" {
  advertise_device_name                   = false
  arp_proxy_enabled                       = false
  band_steering_enabled                   = true
  broadcasting_device_filter              = null
  broadcasting_frequencies_ghz            = [2.4, 5, 6]
  bss_transition_enabled                  = true
  channel_2g_locked_to_6                  = false
  client_isolation_enabled                = true
  dns_assistance_configuration            = null
  dtim_period_2g_locked_to_3              = false
  enabled                                 = true
  hide_name                               = false
  multicast_to_unicast_conversion_enabled = false
  name                                    = "FBI Surveillence Van #3"
  network = {
    network_id = unifi_network.guest.id
    type       = "SPECIFIC"
  }
  security_configuration = {
    coa_enabled                  = null
    encryption                   = null
    fast_roaming_enabled         = false
    group_rekey_interval_seconds = null
    passphrase                   = var.unifi_wifi_passphrase_fbi_van_3
    pmf_mode                     = "OPTIONAL"
    preshared_keys               = null
    radius_configuration         = null
    sae_configuration = {
      anticlogging_threshold_seconds = 5
      sync_time_seconds              = 5
    }
    security_mode             = null
    type                      = "WPA2_WPA3_PERSONAL"
    wpa3_fast_roaming_enabled = false
  }
  site_id       = data.unifi_site.main.id
  type          = "STANDARD"
  uapsd_enabled = false
}

resource "unifi_wifi_broadcast" "tell_my_wifi_love_her" {
  advertise_device_name                   = false
  arp_proxy_enabled                       = false
  band_steering_enabled                   = true
  broadcasting_device_filter              = null
  broadcasting_frequencies_ghz            = [2.4, 5, 6]
  bss_transition_enabled                  = true
  channel_2g_locked_to_6                  = false
  client_isolation_enabled                = false
  dns_assistance_configuration            = null
  dtim_period_2g_locked_to_3              = false
  enabled                                 = true
  hide_name                               = false
  multicast_to_unicast_conversion_enabled = false
  name                                    = "Tell_my_WiFi_love_her"
  network = {
    network_id = null
    type       = "NATIVE"
  }
  security_configuration = {
    coa_enabled                  = null
    encryption                   = null
    fast_roaming_enabled         = false
    group_rekey_interval_seconds = null
    passphrase                   = var.unifi_wifi_passphrase_tell_my_wifi_love_her
    pmf_mode                     = "OPTIONAL"
    preshared_keys               = null
    radius_configuration         = null
    sae_configuration = {
      anticlogging_threshold_seconds = 5
      sync_time_seconds              = 5
    }
    security_mode             = null
    type                      = "WPA2_WPA3_PERSONAL"
    wpa3_fast_roaming_enabled = false
  }
  site_id       = data.unifi_site.main.id
  type          = "STANDARD"
  uapsd_enabled = false
}

resource "unifi_wifi_broadcast" "fbi_van_4" {
  advertise_device_name                   = false
  arp_proxy_enabled                       = false
  band_steering_enabled                   = true
  broadcasting_device_filter              = null
  broadcasting_frequencies_ghz            = [2.4, 5, 6]
  bss_transition_enabled                  = true
  channel_2g_locked_to_6                  = false
  client_isolation_enabled                = false
  dns_assistance_configuration            = null
  dtim_period_2g_locked_to_3              = false
  enabled                                 = false
  hide_name                               = false
  multicast_to_unicast_conversion_enabled = false
  name                                    = "FBI Surveillance Van #4"
  network = {
    network_id = null
    type       = "NATIVE"
  }
  security_configuration = {
    coa_enabled                  = null
    encryption                   = null
    fast_roaming_enabled         = false
    group_rekey_interval_seconds = null
    passphrase                   = var.unifi_wifi_passphrase_fbi_van_4
    pmf_mode                     = "OPTIONAL"
    preshared_keys               = null
    radius_configuration         = null
    sae_configuration = {
      anticlogging_threshold_seconds = 5
      sync_time_seconds              = 5
    }
    security_mode             = null
    type                      = "WPA2_WPA3_PERSONAL"
    wpa3_fast_roaming_enabled = false
  }
  site_id       = data.unifi_site.main.id
  type          = "STANDARD"
  uapsd_enabled = false
}

resource "unifi_wifi_broadcast" "onlylans" {
  advertise_device_name                   = false
  arp_proxy_enabled                       = false
  band_steering_enabled                   = null
  broadcasting_device_filter              = null
  broadcasting_frequencies_ghz            = [2.4]
  bss_transition_enabled                  = true
  channel_2g_locked_to_6                  = false
  client_isolation_enabled                = false
  dns_assistance_configuration            = null
  dtim_period_2g_locked_to_3              = false
  enabled                                 = true
  hide_name                               = false
  multicast_to_unicast_conversion_enabled = false
  name                                    = "OnlyLANs"
  network = {
    network_id = unifi_network.iot.id
    type       = "SPECIFIC"
  }
  security_configuration = {
    coa_enabled                  = null
    encryption                   = null
    fast_roaming_enabled         = false
    group_rekey_interval_seconds = null
    passphrase                   = var.unifi_wifi_passphrase_onlylans
    pmf_mode                     = "OPTIONAL"
    preshared_keys               = null
    radius_configuration         = null
    sae_configuration = {
      anticlogging_threshold_seconds = 5
      sync_time_seconds              = 5
    }
    security_mode             = null
    type                      = "WPA2_WPA3_PERSONAL"
    wpa3_fast_roaming_enabled = false
  }
  site_id       = data.unifi_site.main.id
  type          = "STANDARD"
  uapsd_enabled = false
}

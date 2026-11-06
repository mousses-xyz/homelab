# DHCP reservations (MAC -> fixed IP).

# DHCP reservation: Teslacam (2c:cf:67:a9:6d:af) -> 10.9.20.8.
resource "unifi_dhcp_reservation" "teslacam" {
  site_id     = data.unifi_site.main.id
  mac_address = "2c:cf:67:a9:6d:af"
  fixed_ip    = "10.9.20.8"
  enabled     = true
}

# DHCP reservation: Switch (80:69:1a:54:6a:14) -> 10.9.20.3.
resource "unifi_dhcp_reservation" "switch" {
  enabled     = true
  fixed_ip    = "10.9.20.3"
  mac_address = "80:69:1a:54:6a:14"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Aqara Hub M200 (54:ef:44:a3:76:15) -> 10.12.10.146.
resource "unifi_dhcp_reservation" "aqara_hub" {
  enabled     = true
  fixed_ip    = "10.12.10.146"
  mac_address = "54:ef:44:a3:76:15"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Red Queen (38:a7:46:e6:c0:a7) -> 10.9.20.242.
resource "unifi_dhcp_reservation" "red_queen" {
  enabled     = true
  fixed_ip    = "10.9.20.242"
  mac_address = "38:a7:46:e6:c0:a7"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: ATProto PDS (bc:24:11:bb:f8:d5) -> 10.9.20.12.
resource "unifi_dhcp_reservation" "atproto_pds" {
  enabled     = true
  fixed_ip    = "10.9.20.12"
  mac_address = "bc:24:11:bb:f8:d5"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Kitty VM host (98:b7:85:21:38:4c) -> 10.9.20.5.
resource "unifi_dhcp_reservation" "kitty_vm_host" {
  enabled     = true
  fixed_ip    = "10.9.20.5"
  mac_address = "98:b7:85:21:38:4c"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Synology NAS (90:09:d0:60:d1:71) -> 10.9.20.2.
resource "unifi_dhcp_reservation" "synology_nas" {
  enabled     = true
  fixed_ip    = "10.9.20.2"
  mac_address = "90:09:d0:60:d1:71"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Minecraft VM (bc:24:11:6d:ec:17) -> 10.9.20.11.
resource "unifi_dhcp_reservation" "minecraft_vm" {
  enabled     = true
  fixed_ip    = "10.9.20.11"
  mac_address = "bc:24:11:6d:ec:17"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Tower (1a:4b:24:a9:83:f3) -> 10.9.20.7.
resource "unifi_dhcp_reservation" "tower" {
  enabled     = true
  fixed_ip    = "10.9.20.7"
  mac_address = "1a:4b:24:a9:83:f3"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Whale pi (2c:cf:67:22:09:90) -> 10.9.20.10.
resource "unifi_dhcp_reservation" "whale_pi" {
  enabled     = true
  fixed_ip    = "10.9.20.10"
  mac_address = "2c:cf:67:22:09:90"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: GL-iNet travel router (94:83:c4:4b:e9:a6) -> 10.9.20.9.
resource "unifi_dhcp_reservation" "gl_inet_travel_router" {
  enabled     = true
  fixed_ip    = "10.9.20.9"
  mac_address = "94:83:c4:4b:e9:a6"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Thesis VM (bc:24:11:04:8e:31) -> 10.9.20.50.
resource "unifi_dhcp_reservation" "thesis_vm" {
  enabled     = true
  fixed_ip    = "10.9.20.50"
  mac_address = "bc:24:11:04:8e:31"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Anker dock (f8:e4:3b:c7:4b:15) -> 10.9.20.6.
resource "unifi_dhcp_reservation" "anker_dock" {
  enabled     = true
  fixed_ip    = "10.9.20.6"
  mac_address = "f8:e4:3b:c7:4b:15"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Home Assistant Pi (d8:3a:dd:ad:78:ea) -> 10.12.10.4.
resource "unifi_dhcp_reservation" "home_assistant_pi" {
  enabled     = true
  fixed_ip    = "10.12.10.4"
  mac_address = "d8:3a:dd:ad:78:ea"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Open Media Vault (34:5a:60:01:70:71) -> 10.9.20.14.
resource "unifi_dhcp_reservation" "open_media_vault" {
  enabled     = true
  fixed_ip    = "10.9.20.14"
  mac_address = "34:5a:60:01:70:71"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: Canon Printer (00:bb:c1:69:6b:d3) -> 10.12.10.2.
resource "unifi_dhcp_reservation" "canon_printer" {
  enabled     = true
  fixed_ip    = "10.12.10.2"
  mac_address = "00:bb:c1:69:6b:d3"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: DNS server (bc:24:11:ae:36:89) -> 10.9.20.4.
resource "unifi_dhcp_reservation" "dns" {
  enabled     = true
  fixed_ip    = "10.9.20.4"
  mac_address = "bc:24:11:ae:36:89"
  site_id     = data.unifi_site.main.id
}

# DHCP reservation: claude-1 (bc:24:11:81:80:22) -> 10.7.27.6.
resource "unifi_dhcp_reservation" "claude_1" {
  enabled     = true
  fixed_ip    = "10.7.27.6"
  mac_address = "bc:24:11:81:80:22"
  site_id     = data.unifi_site.main.id
}

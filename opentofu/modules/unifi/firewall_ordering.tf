# Ordering of user-defined policies relative to UniFi's built-in policies.

# Order the four user-defined Internal -> Internal policies before built-in rules.
resource "unifi_firewall_policy_ordering" "internal_internal" {
  site_id             = data.unifi_site.main.id
  source_zone_id      = data.unifi_firewall_zone.internal.id
  destination_zone_id = data.unifi_firewall_zone.internal.id

  before_system_defined_policy_ids = [
    unifi_firewall_policy.home_assistant_comms.id,
    unifi_firewall_policy.home_assistant_comms_2.id,
    unifi_firewall_policy.talk_to_claude.id,
    unifi_firewall_policy.claude_to_red_queen.id,
  ]
  after_system_defined_policy_ids = []
}

# Order the two user-defined Internal -> External policies before built-in rules.
resource "unifi_firewall_policy_ordering" "internal_external" {
  site_id             = data.unifi_site.main.id
  source_zone_id      = data.unifi_firewall_zone.internal.id
  destination_zone_id = data.unifi_firewall_zone.external.id

  before_system_defined_policy_ids = [
    unifi_firewall_policy.home_assistant_wan.id,
    unifi_firewall_policy.matter_hub.id,
  ]
  after_system_defined_policy_ids = []
}

# Order the user-defined External -> Internal policy before built-in rules.
resource "unifi_firewall_policy_ordering" "external_internal" {
  site_id             = data.unifi_site.main.id
  source_zone_id      = data.unifi_firewall_zone.external.id
  destination_zone_id = data.unifi_firewall_zone.internal.id

  before_system_defined_policy_ids = [
    unifi_firewall_policy.bluesky_ipv6.id,
  ]
  after_system_defined_policy_ids = []
}

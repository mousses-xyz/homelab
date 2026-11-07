output "site_id" {
  value       = data.unifi_site.main.id
  description = "UUID of the managed UniFi site."
}

output "site_name" {
  value       = data.unifi_site.main.name
  description = "Name of the managed UniFi site."
}

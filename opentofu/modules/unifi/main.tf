# Read-only lookup used to verify the provider is configured correctly.
# Resources that manage UDR7 configuration will reference this site ID.
data "unifi_site" "main" {
  name = var.unifi_site_name
}

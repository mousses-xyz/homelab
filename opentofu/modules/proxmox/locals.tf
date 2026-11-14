locals {
	# The provider appends /api2/json itself, so the endpoint must be the
	# Proxmox base URL only.
	proxmox_primary_node_api_url = "https://${var.proxmox_primary_node_name}.${var.domain_name}:${var.proxmox_api_port}/"
}

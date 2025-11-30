locals {
	proxmox_primary_node_api_url = "https://${var.proxmox_primary_node_name}.${var.domain_name}:${var.proxmox_api_port}/${var.proxmox_api_subroute}"
	proxmox_secondary_node_api_url = "https://10.9.20.7:8006/${var.proxmox_api_subroute}"#"https://${var.proxmox_secondary_node_name}.${var.domain_name}:${var.proxmox_api_port}/${var.proxmox_api_subroute}"
}
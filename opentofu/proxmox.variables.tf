variable "proxmox_api_port" {
	type = number
	sensitive = false
	description = "Port to access Proxmox GUI/API."
}
variable "proxmox_api_subroute" {
	type = string
	sensitive = false
	description = "Sub-route to point Proxmox API endpoints"
}
variable "proxmox_primary_node_name" {
	type = string
	sensitive = false
	description = "Name of primary proxmox node (with router)."
}
variable "proxmox_primary_node_api_token" {
	type = string
	sensitive = true
	description = "The Proxmox API token for the primary node."
}
variable "proxmox_secondary_node_name" {
	type = string
	sensitive = false
	description = "Name of secondary proxmox node (can be shut off)."
}
variable "proxmox_secondary_node_api_token" {
	type = string
	sensitive = true
	description = "The Proxmox API token for the secondary node."
}
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
variable "proxmox_primary_node_ipv4_reserved_fourth_number" {
	type = string
	sensitive = true
	description = "Fourth number in IPv4 Address. For example Y when x.x.x.Y is the address."
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
variable "proxmox_secondary_node_ipv4_reserved_fourth_number" {
	type = string
	sensitive = true
	description = "Fourth number in IPv4 Address. For example Y when x.x.x.Y is the address."
}
variable "proxmox_secondary_node_backup_ipv4_reserved_fourth_number" {
	type = string
	sensitive = true
	description = "Fourth number in IPv4 Address. For example Y when x.x.x.Y is the address."
}

variable "domain_name" {
	type = string
	description = "Registered domain name to use for hosts, services, proxies, etc."
}

variable "lan_ipv4_prefix" {
	type = string
	description = "Subnet in IPv4 space. X-es in X.X.X.y address space."
}
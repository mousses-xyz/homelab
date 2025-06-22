resource "proxmox_virtual_environment_network_linux_bridge" "LAN1" {
	node_name	= var.proxmox_secondary_node_name
	name		= "LAN1"
	gateway		= "${var.ipv4_lan_prefix}.1"
	address		= "${var.ipv4_lan_prefix}.${var.proxmox_secondary_node_ipv4_reserved_fourth_number}/24"
	comment		= "SFP+ Closer to PCIe connector"
	autostart	= true
	vlan_aware	= true
	ports = [
		# Network (or VLAN) interfaces to attach to the bridge, specified by their interface name
		# (e.g. "ens18.99" for VLAN 99 on interface ens18).
		# For VLAN interfaces with custom names, use the interface name without the VLAN tag, e.g. "vlan_lab"
		"enp5s0f1"
	]
}

resource "proxmox_virtual_environment_network_linux_bridge" "WAN1" {
	node_name	= var.proxmox_secondary_node_name
	name		= "WAN1"
	comment		= "SFP+ further from PCIe"
	autostart	= true
	vlan_aware	= true
	ports = [
		# Network (or VLAN) interfaces to attach to the bridge, specified by their interface name
		# (e.g. "ens18.99" for VLAN 99 on interface ens18).
		# For VLAN interfaces with custom names, use the interface name without the VLAN tag, e.g. "vlan_lab"
		"enp5s0f0"
	]
}

resource "proxmox_virtual_environment_network_linux_bridge" "Mobo" {
	node_name	= var.proxmox_secondary_node_name
	name		= "Mobo"
	address		= "${var.ipv4_lan_prefix}.${var.proxmox_secondary_node_backup_ipv4_reserved_fourth_number}/24"
	comment		= "Motherboard RJ45"
	autostart	= true
	vlan_aware	= true
	ports = [
		# Network (or VLAN) interfaces to attach to the bridge, specified by their interface name
		# (e.g. "ens18.99" for VLAN 99 on interface ens18).
		# For VLAN interfaces with custom names, use the interface name without the VLAN tag, e.g. "vlan_lab"
		"enp6s0"
	]
}
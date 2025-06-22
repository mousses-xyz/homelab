resource "proxmox_virtual_environment_network_linux_bridge" "LAN1" {
	node_name	= "tower"
	name		= "LAN1"
	gateway		= "***REMOVED***.1"
	address		= "***REMOVED***/24"
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
	node_name	= "tower"
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
	node_name	= "tower"
	name		= "Mobo"
	address		= "***REMOVED***/24"
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
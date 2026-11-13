# The bridge resources from the decommissioned node are no longer managed.
# Forget them without attempting to contact the removed provider.
removed {
  from = proxmox_virtual_environment_network_linux_bridge.LAN1

  lifecycle {
    destroy = false
  }
}

removed {
  from = proxmox_virtual_environment_network_linux_bridge.WAN1

  lifecycle {
    destroy = false
  }
}

removed {
  from = proxmox_virtual_environment_network_linux_bridge.Mobo

  lifecycle {
    destroy = false
  }
}
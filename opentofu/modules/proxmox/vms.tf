# Pre-existing VMs on the primary node, imported into OpenTofu state.
#
# Power state is managed manually on the host: every VM sets started = false
# and ignores changes to started. Automatic reboots during updates are also
# disabled so updates never restart a running VM.

resource "proxmox_virtual_environment_vm" "minecraft" {
  node_name = var.proxmox_primary_node_name
  vm_id     = 101
  name      = "minecraft"

  started             = false
  reboot_after_update = false
  on_boot             = false

  boot_order    = ["scsi0", "net0"]
  scsi_hardware = "virtio-scsi-single"

  cpu {
    cores   = 4
    sockets = 1
    type    = "x86-64-v2-AES"
  }

  memory {
    dedicated = 10240
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    iothread     = true
    size         = 64
    ssd          = true
  }

  network_device {
    bridge      = "LAN1"
    model       = "virtio"
    mac_address = "BC:24:11:6D:EC:17"
    firewall    = true
  }

  operating_system {
    type = "l26"
  }

  smbios {
    uuid = "71641a39-351f-4d10-ba8d-86ee2b449c6f"
  }

  lifecycle {
    ignore_changes = [started]
  }
}

resource "proxmox_virtual_environment_vm" "thesis" {
  node_name = var.proxmox_primary_node_name
  vm_id     = 103
  name      = "thesis"

  started             = false
  reboot_after_update = false
  on_boot             = false

  boot_order    = ["net0"]
  scsi_hardware = "virtio-scsi-single"

  cpu {
    cores   = 2
    sockets = 1
    type    = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi1"
    iothread     = true
    size         = 128
  }

  network_device {
    bridge      = "LAN1"
    model       = "virtio"
    mac_address = "BC:24:11:04:8E:31"
    firewall    = true
  }

  operating_system {
    type = "l26"
  }

  smbios {
    uuid = "cd9d6beb-6464-4916-a8f6-3c087fabcc43"
  }

  lifecycle {
    ignore_changes = [started]
  }
}

resource "proxmox_virtual_environment_vm" "pds" {
  node_name = var.proxmox_primary_node_name
  vm_id     = 104
  name      = "pds"

  started             = false
  reboot_after_update = false
  on_boot             = true

  boot_order    = ["scsi0", "net0"]
  scsi_hardware = "virtio-scsi-single"

  cpu {
    cores   = 1
    sockets = 1
    type    = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    iothread     = true
    size         = 32
  }

  network_device {
    bridge      = "LAN1"
    model       = "virtio"
    mac_address = "BC:24:11:BB:F8:D5"
    firewall    = true
  }

  operating_system {
    type = "l26"
  }

  smbios {
    uuid = "b40fdb4e-73bd-4789-b55c-f21f482838c1"
  }

  lifecycle {
    ignore_changes = [started]
  }
}

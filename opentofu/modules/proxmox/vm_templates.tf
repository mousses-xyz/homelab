# resource "proxmox_virtual_environment_vm" "ubuntu_template" {
# 	# https://search.opentofu.org/provider/bpg/proxmox/latest/docs/guides/clone-vm
# 	name        = "test-vm"
# 	node_name = "tower"

# 	template=true
# 	started=false

# 	machine     = "q35"
# 	bios        = "ovmf"
# 	description = "Managed by OpenTofu"

# 	cpu {
# 		cores = 2
# 	}

# 	memory {
# 		dedicated = 2048
# 	}

# 	efi_disk {
# 		datastore_id = "local-zfs"
# 		type         = "4m"
# 	}

# 	disk {
# 		datastore_id = "local-lvm"
# 		file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
# 		interface    = "virtio0"
# 		iothread     = true
# 		discard      = "on"
# 		size         = 20
# 	}

# 	initialization {
# 		ip_config {
# 			ipv4 {
# 				address = "dhcp"
# 			}
# 		}

# 		user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
# 	}

# 	network_device {
# 		bridge = "LAN1"
# 	}
# }

# resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
# 	content_type = "iso"
# 	datastore_id = "local"
# 	node_name    = "tower"

# 	url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
# }
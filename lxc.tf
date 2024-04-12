resource "proxmox_virtual_environment_vm" "bgp" {
  name = "${var.namespace}-pfa"
  description = "PfSense Firewall"
  node_name   = var.pve_node_name

  vm_id = var.vm_id_start

  disk {
    datastore_id = "local"
    interface    = "scsi0"
    size = 8
  }
  
  cpu {
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 1024
  }

  clone {
    vm_id = 900 # pfSense Firewall template
    retries = 2
  }

  agent {
    enabled = false
  }

  network_device {
    bridge  = var.wan_bridge
    model   = "virtio"
  }

  network_device {
    bridge  = proxmox_virtual_environment_network_linux_bridge.network.name
    model   = "virtio"
  }
}
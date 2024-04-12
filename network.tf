resource "proxmox_virtual_environment_network_linux_bridge" "network" {
  name = "vmbr${var.vmbr}"
  node_name = var.pve_node_name

  autostart = true
  comment = "LAN Bridge for ${var.namespace}"
}
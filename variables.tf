variable "pve_endpoint" {
  description = "The Proxmox VE API endpoint"
  type        = string
  default     = "https://proxmox.epsilon:8006/"
}

variable "pve_api_token" {
  description = "The Proxmox VE API token"
  type        = string
}

variable "pve_node_name" {
  description = "The Proxmox VE node name"
  type        = string
  default     = "epsilon"
}

variable "vmbr" {
  description = "The unused vmbr number"
  type        = number
  default     = 5
}

variable "wan_bridge" {
  description = "The WAN bridge"
  type        = string
  default     = "vmbr1"
}

variable "namespace" {
  description = "The namespace for the resources"
  type        = string
  default     = "tf01"
}

variable "vm_id_start" {
  description = "The starting VM ID"
  type        = number
  default     = 1100
}

variable "vm_datastore" {
  description = "The storage for the VMs"
  type        = string
  default     = "local"
}
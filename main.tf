terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.53.1"
    }
  }
}

provider "proxmox" {
  endpoint = "https://proxmox.epsilon:8006/"
  insecure = true
  api_token = var.pve_api_token
}
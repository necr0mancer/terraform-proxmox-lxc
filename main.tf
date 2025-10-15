terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
  #required_version = ">= 0.14"
}


provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
  #pm_minimum_permission_check = false
}


resource "proxmox_lxc" "test-container" {
  count        = var.lxc_count
  hostname     = "LXC-test-${count.index + 1}"
  target_node  = var.node_name
  vmid         = 2001 + count.index # Ensure unique VMIDs
  ostemplate   = "local:vztmpl/${var.lxc_template}"
  cores        = var.lxc_cores
  memory       = var.lxc_memory
  password     = var.lxc_password
  unprivileged = true
  onboot       = true
  start        = true

  rootfs {
    #storage = "local-lvm"
    storage = "local"
    size    = "2G"
  }

  features {
    nesting = true
  }
  
  network {
     name   = "eth0"
     bridge = "vmbr0"
     #ip     = "dhcp"
     ip     = "10.0.15.${count.index +1}/24"
     type   = "veth"
  }
}

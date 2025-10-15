variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "node_name" {
  type    = string
  default = "pvesrv03"
}

variable "lxc_template" {
  type    = string
  default = "debian-12-standard_12.12-1_amd64.tar.zst"
}

variable "lxc_storage" {
  type    = string
  default = "local-lvm"
}

variable "lxc_password" {
  type      = string
  #default   = "passwordhere"
  sensitive = true
}

variable "lxc_memory" {
  type    = number
  default = 256
}

variable "lxc_cores" {
  type    = number
  default = 1
}

variable "lxc_count" {
  type    = number
  default = 20
}

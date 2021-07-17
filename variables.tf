# Description : Terraform label module variables
#--------------------------------------------------------------------------------
# Module      : LABEL
# source: clouddrove/labels/digitalocean
#--------------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = ""
  description = "Name for label module and DNS name (e.g. `app` or `cluster`)"
}

variable "application" {
  type        = string
  default     = ""
  description = "Application for label module (e.g. `cd` or `clouddrove`)"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment for label module (e.g. `prod`, `dev`, `staging`)"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order for label module, e.g. `name`,`application`"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between label module parameters `name`, `application`, and `environment`"
}

#--------------------------------------------------------------------------------
# Module      : droplet
# main.tf
#--------------------------------------------------------------------------------
variable "droplet_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the droplet creation"
}

variable "region" {
  type        = string
  default     = "sfo3"
  description = "region to create VPC (ams2, ams3, blr1, fra1, lon1, nyc1, nyc2, nyc3, sfo1, sfo2, sfo3, sgp1, tor1) Default: sfo3"
}

variable "backups" {
  type        = bool
  default     = false
  description = "Boolean controlling if backups are made Default: false"
}

variable "block_storage_filesystem_label" {
  type        = string
  default     = "data"
  description = "Initial filesystem label for the block storage volume"
}

variable "block_storage_filesystem_type" {
  type        = string
  default     = "xfs"
  description = "Initial filesystem label for the block storage volume (xfs or ext4)"
}

variable "block_storage_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Boolean to control if more block storage is created. Default: false"
}

variable "block_storage_size" {
  type        = number
  default     = 0
  description = "(Required if block_storage_enabled=true) size of block storage in GiB. If updated, can only be expanded"
}

variable "custom_image" {
  type        = bool
  default     = false
  description = "Image is custom or not (an official image)"
}

variable "droplet_count" {
  type        = number
  default     = 1
  description = "number of droplets / other resources to create. Default: 1"
}

variable "createdby" {
  type        = string
  default     = "terraform"
  description = "CreatedBy in label module. Default='terraform'"
}

variable "droplet_size" {
  type        = string
  default     = "nano"
  description = "size of a droplet (s-1vcpu-1gb, s-1vcpu-2gb, s-2vcpu-4gb, s-4vcpu-8gb, m-2vcpu-16gb, c-2, c-4, g-2vcpu-8gb, gd-2vcpu-8gb) Default: s-1vcpu-1gb"
}

variable "floating_ip" {
  type        = bool
  default     = false
  description = "(Optional) Boolean to control whether floating IPs should be created. Default: false"
}

variable "floating_ip_assign" {
  type        = bool
  default     = true
  description = "(Optional) Boolean controlling whether floating IPs are assigned to instances with terraform. Default: true"
}

variable "floating_ip_count" {
  type        = string
  default     = ""
  description = "Number of floating IPs to create"
}

variable "image_id" {
  type        = string
  default     = ""
  description = "id of public or private image to use"
}

variable "image_name" {
  type        = string
  default     = "ubuntu-18-04-x64"
  description = "image name or slug to lookup. Default: ubuntu-18-04-x64"
}

variable "ipv6" {
  type        = bool
  default     = false
  description = "(Optional) Boolean controlling if IPv6 is enabled. Default: false"
}

variable "monitoring" {
  type        = bool
  default     = false
  description = "(Optional) Boolean controlling whether monitoring agent is installed. Default: false"
}

variable "private_networking" {
  type        = bool
  default     = false
  description = "(Optional) Boolean controlling if private networks are enabled. Default: false"
}

variable "resize_disk" {
  type        = bool
  default     = true
  description = "(Optional) Boolean controlling if increase disk size when resizing a droplet. Default: true. if false, only RAM and CPU will be resized. Increasing disk size is permanent. Increasing RAM and CPU is reversible."
}

variable "ssh_keys" {
  type        = list(any)
  default     = []
  description = "(Optional) list of SSH IDs or fingerprints to enable in the format [12345, 123456]. To retrieve this info, use a tool such as curl with the DigitalOcean API"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "(Optional) A string of cloud init User Data to initialize droplet"
}

variable "vpc_uuid" {
  type        = string
  default     = ""
  description = "ID of VPC where the droplet will be located"
}



variable "domain" {
  type        = string
  default     = "example.com"
  description = "pre-existing DNS domain name used to add DNS record for created droplet"
}
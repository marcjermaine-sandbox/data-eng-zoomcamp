locals {
  data_lake_bucket = "dtc_data_lake"
}

variable "linode_token" {
  description = "Linode API token"
  type = string
}

variable "project" {
  description = "Your Linode Project name"
  type = string
  default = "Zoomcamp"
}

variable "region" {
  description = "Region for Linode resources. Choose as per your location: https://www.linode.com/docs/platform/availability-and-regions"
  default = "us-east"
  type = string
}

variable "size" {
  description = "Size of the block storage. Check official docs for more info."
  default = 20
  type = number
}

variable "image" {
  description = "Image for the instance. Check official docs for more info."
  default = "linode/ubuntu20.04"
  type = string
}

variable "type" {
  description = "Type of the instance. Check official docs for more info."
  default = "g6-nanode-1"
  type = string
}

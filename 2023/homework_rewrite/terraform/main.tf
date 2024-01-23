terraform {
  required_version = ">= 1.0"
  backend "local" {}
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

resource "linode_volume" "data-lake-volume" {
  label = "${local.data_lake_bucket}_${var.project}"
  size = var.size
  region = var.region
}

resource "linode_instance" "example" {
  label = "example"
  region = var.region
  image = var.image
  type = var.type
}

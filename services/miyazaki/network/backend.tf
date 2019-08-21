terraform {

  required_version = "~> 0.12"

  required_providers {
    aws = "~> 2"
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "miyazaki"
    workspaces {
      prefix = "miyazaki-network-"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source = "../../../modules/aws_vpc"

  name = var.env[terraform.workspace].vpc-name

  cidr = var.env[terraform.workspace].cidr

  azs                 = var.azd
  private_subnets     = "${split(",", var.env[terraform.workspace].cidrs_private)}"
  public_subnets      = "${split(",", var.env[terraform.workspace].cidrs_public)}"
  elasticache_subnets = "${split(",", var.env[terraform.workspace].cidrs_elasticache)}"

  assign_generated_ipv6_cidr_block = "false"

  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  # enable_nat_gateway = var.env[terraform.workspace].nat-gateway
  # single_nat_gateway = var.env[terraform.workspace].single-nat-gateway

  public_subnet_tags = {
    Name = "public-${var.env[terraform.workspace].vpc-name}-subnet"
  }

  private_subnet_tags = {
    Name = "private-${var.env[terraform.workspace].vpc-name}-subnet"
  }

  tags = {
    service-name = var.service-name
    owner        = var.owner
    Environment  = terraform.workspace
    Version      = var.tag[terraform.workspace].version
  }

  vpc_tags = {
    Name = var.env[terraform.workspace].vpc-name
  }
}












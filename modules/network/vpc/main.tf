/**
 * VPC
 */
resource "aws_vpc" "main" {
  cidr_block           = var.cidr
  enable_dns_support   = var.enable-dns-support
  enable_dns_hostnames = var.enable-dns-hostnames

  tags = {
    Name        = var.vpc-name
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}
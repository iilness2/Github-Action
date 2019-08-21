resource "aws_nat_gateway" "main" {
  allocation_id = var.eip-id
  subnet_id     = var.subnet-id
  tags =  {
    Name        = "${var.vpc-name}-nat-gw"
    VPC-Name    = var.vpc-name
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}
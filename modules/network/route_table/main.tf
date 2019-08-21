## Creating the internet gateway
resource "aws_route_table" "main" {
  vpc_id = var.vpc-id

  tags = {
    Name        = "${var.vpc-name}-${var.type}"
    VPC-Name    = var.vpc-name
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}
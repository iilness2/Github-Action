## Creating the internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc-id
  tags =  {
    Name        = "${var.vpc-name}-gw"
    VPC-Name    = var.vpc-name
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}
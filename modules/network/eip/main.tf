## Creating the Elastic IP
resource "aws_eip" "main" {
  vpc        = true
  tags = {
    Name        = "${var.vpc-name}-eip"
    VPC-Name    = var.vpc-name
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}
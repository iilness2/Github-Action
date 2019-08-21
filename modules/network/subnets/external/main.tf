/**
 * Subnets.
 */
resource "aws_subnet" "main" {
  vpc_id            = var.vpc-id
  cidr_block        = var.subnets-cidr[count.index]
  availability_zone = var.availability-zones[count.index]
  count             = length(var.subnets-cidr)

  tags =  {
    Name        = "${var.vpc-name}-${format("external-%03d", count.index)}-subnet"
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}
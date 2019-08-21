### Create Cluster for ECS
resource "aws_ecs_cluster" "main" {
  name = "${var.name}-cluster"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name         = var.name
    Environment  = var.environment
    Entity       = var.entity
    ManagedBy    = var.managedby
    Versions     = var.versions
    Owner        = var.owner
    service-name = var.service-name
  }
}


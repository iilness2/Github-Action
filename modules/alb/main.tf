resource "aws_alb" "main" {
  name                             = "${var.name}-alb"
  internal                         = var.internal-lb-value
  security_groups                  = var.security-groups
  enable_cross_zone_load_balancing = var.enable-cross-zone-load-balancing
  enable_http2                     = var.enable-http2
  subnets                          = var.subnet-ids
  access_logs {
    bucket  = var.access-log-bucket-name
    prefix  = "alb/${var.environment}/${var.name}"
    enabled = var.enable-access-log
  }

  tags = {
    Name        = "${var.name}-alb"
    Environment = var.environment
    Entity      = var.entity
    ManagedBy   = var.managedby
    Versions    = var.versions
    Owner       = var.owner
    service-name= var.service-name
  }
}


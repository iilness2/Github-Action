variable "name" {
  description = "AWS ALB Name"
}

variable "http_code" {
  description = "HTTP Code for health check"
}

variable "alb_port" {
  description = "ALB Port to Monitor"
}

variable "alb_check_path" {
  description = "ALB health check path"
}

variable "cert_acm_arn" {
  description = "ssl certificate arn for aws_alb_listener at 443"
}

variable "alb_arn" {
  description = "To which alb it needs to connect"
}

variable "vpc_id" {
  description = "In which vpc this tg will be created."
}

### Tags
variable "service-name" {
  description = "Tag: Service Name for all resources"
}

variable "owner" {
  description = "Tag: Owner of the resources"
}

variable "versions" {
  description = "Tag: version for the complete architecture"
}

variable "managedby" {
  description = "Tag: Managedby By"
}

variable "environment" {
  description = "Tag: Environment name"
}

variable "entity" {
  description = "Tag: Entity Name"
}


variable "tf-state-region" {
  description = "AWS region for tfstate"
}

variable "tf-state-environment" {
  description = "s3 bucket file pattern for environment"
}

variable "tf-state-bucket-name" {
  description = "s3 bucket name"
}

variable "cluster-name" {
  description = "Cluster Name, -cluster will be appended by default."
}

### ALB variables
variable "enable-access-log" {
  description = "Boolean value"
}

variable "enable-cross-zone-load-balancing" {
  description = "Boolean value"
}

variable "enable-http2" {
  description = "Boolean value"
}

variable "access-log-bucket-name" {
  description = "Bucket name for storing the logs of loadblancer"
}

variable "internal-lb-value" {
  description = "Boolean value, Is it a internal load balancer"
}

### Target Group
variable "alb-health-check-path" {
  description = "Application Load balancer health check path"
}

variable "alb-target-group-port" {
  description = "target group will hit on this port of the attached instance"
}

variable "http-code" {
  description = "Http code to check if result is success or not, normally put 200"
}

variable "cert-arn" {
  description = "certificate for https listerner in alb"
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


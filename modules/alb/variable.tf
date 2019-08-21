variable "name" {
  description = "AWS ALB Name"
}

variable "internal-lb-value" {
  description = "Boolean value if internal load balancer required"
}

variable "subnet-ids" {
  description = "A list of subnet IDs This will decide also the availability zones"
  type        = list(string)
}

variable "security-groups" {
  description = "A list of SG IDs"
  type        = list(string)
}

variable "enable-cross-zone-load-balancing" {
  description = "enable_cross_zone_load_balancing boolean, default - false"
}

variable "enable-http2" {
  description = "enable http2 protocal - Boolean value"
}

variable "access-log-bucket-name" {
  description = "S3 bucket in which all logs going to store"
}

variable "enable-access-log" {
  description = "Boolean value for enabling access logs"
}

### Tags
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
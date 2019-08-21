variable "name" {
  description = "Auto scaling group name - asg will be appand"
}

variable "region" {
  description = "AWS Region, e.g us-west-2"
}

variable "launch_configuration" {
  description = "Name of the launch configuration"
}

variable "desired_capacity" {
  default = "2"
}

variable "application-type" {
  description = "Tag value"
}

variable "max_size" {
  description = "Max no of instances in the asg can be possible"
}

variable "min_size" {
  description = "Min no of instances in the asg can be possible"
}

variable "availability_zones" {
  type        = "list"
  description = "A list of one or more availability zones for the group"
}

variable "application" {
  description = "Tag Value"
}

variable "entity" {
  description = "AWS Region, e.g us-west-2, Tag Value"
}

variable "subnet_ids" {
  description = "A Internal subnet id"
  type        = "list"
}

variable "environment" {
  description = "Environment tag, e.g prod, Tag Value"
}

variable "logrotate" {
  description = "for s3 logrotate yes/no, Script will check if the instance is having this tag then only lograte will work"
}


variable "elb_names" {
  description = "List of classic loadbalancer names"
  type = "list"
}
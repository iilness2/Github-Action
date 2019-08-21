variable "namespace" {
  description = "Alaram matric launch config"
}

variable "asg_name" {
  description = "alarm will be attached to this dimension"
}

variable "instances_cpu_high_threshold" {
  description = "Threshold value for instances_cpu_high cloud watch alaram"
}

variable "instances_cpu_low_threshold" {
  description = "Threshold value for instances_cpu_low cloud watch alaram"
}


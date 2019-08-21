variable "lb_name" {
  description = "Name of ALB"
}

variable "lb_arn" {
  description = "LB arn for which this alram is going to be created."
  default = ""
}

variable "asg_name" {
  description = "Name of the ASG for alarm setup"
  default = ""
}

variable "slack_notifications_arn" {
  description = ""
}
variable "latency_threshold" {}

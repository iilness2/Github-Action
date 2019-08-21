variable "lb_name" {
  description = "Name of ALB, will be used in cloudwatch alarm name"
}

variable "lb_arn" {
  description = "Load balancer ARN, will be used in dimesion for cloud watch alarm"
}

variable "asg_name" {
  description = "Name of ASG, will be used in cloudwatch alarm description"
}

variable "tg_name" {
  description = "Name of Target Group, will be used in cloudwatch alarm name (request-per-target)"
}

variable "tg_arn" {
  description = "ARN of Target Group, will be used in cloudwatch alarm name (request-per-target)"
}

variable "slack_notifications_arn" {
  description = "ARN for slack notification action, will be used in alarm_actions"
}

variable "latency_threshold" {
  description = "Threshold values in digits for alarm"
}


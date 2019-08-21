# Module cloudwatch alarms

### Resources
- aws_autoscaling_notification (Slack Notifications)
- aws_cloudwatch_metric_alarm
    - elb 5XX
    - http 5XX
- aws_cloudwatch_metric_alarm
    - elb 4XX
    - http 4XX
- aws_cloudwatch_metric_alarm
    - request-per-target
    - target-latnecy
    - unhealthy-hosts
    
### Input
```sh
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

```

### How to use with variables.tfvars
```sh
lb_name                    = ""
lb_arn                     = ""
asg_name                   = ""
tg_name                    = ""
tg_arn                     = ""
slack_notifications_arn    = ""
latency_threshold          = 40
```    

### How to use as a module
```sh
  module "related-search-cloudwatch-alarm" {
  source   = "../modules/cloudwatch_alarms"
  asg_arn  = "${module.related-search-asg.asg_arn}"
  asg_name = "${module.related-search-asg.asg_name}"
  latency_threshold  = "0.5"
  lb_arn   = "${module.related-search-alb.alb_arn_suffix}"
  lb_name  = "${module.related-search-alb.alb_name}"
  tg_arn   = "${module.related-search-tg.target_group_arn_suffix}"
  tg_name  = "${module.related-search-tg.target_group_name}"
  slack_notifications_arn="${var.slack_notifications}"
}
```
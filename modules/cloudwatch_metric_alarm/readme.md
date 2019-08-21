# Module ALB CloudWatch Alarms

This module is going to create 5xx and 4xx alarms for both elb and http

#### List of alarms
- elb 5XX
- elb 4XX
- http 5XX
- http 4XX
- target-latnecy

# Inputs 
```sh
variable "lb_name" {
  description = "Name of ALB"
}

variable "lb_arn" {
  default = ""
}

variable "asg_name" {
  default = ""
}

variable "slack_notifications_arn" {}
variable "latency_threshold" {}

```

#### How to Use for variables.tfvars files
```sh
lb_name = ""
lb_arn = ""
asg_name = ""
slack_notifications_arn = ""
latency_threshold = 50
```

#### How to use as a module
```sh
module "alb_cloudwatch_alarms"
{
    source = "../modules/alb_cloudwatch_alarms"
    lb_name = "LoadBalancer Name"
    lb_arn = "Load Balancer ARN"
    asg_name = "AutoScaling Policy"
    slack_notifications_arn = "Lamda Function as an action"
    latency_threshold = "Threshold Value"
}
```
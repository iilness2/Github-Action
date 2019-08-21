# Module ALB Listener Rule

This module is going to create the listerners, request forwading rules for loadbalancers.

##  List of rule
- http (80)
- https (443)

# Inputs
```sh
variable "target_listner443" {
  description = "ALB listener arn listening to port 443"
}

variable "target_listner80" {
  description = "ALB listener arn listening to port 80"
}

variable "host" {
  description = "Rule applied only to this host"
}

variable "target_group_arn" {
  description = "The ARN of the Target Group to which to route traffic. Required if type is forward"
}

variable "priority" {
  description = "The priority for the rule between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule. A listener can't have multiple rules with the same priority"
}
```

# How to Use with variables.tfvars
```sh
target_listner443 = "Will be generated when creating the target group from modules"
target_listner80 = "Will be generated when creating the target group from modules"
target_group_arn = "Will be generated when creating the target group from modules"
host = ""
priority = ""
```

# How to use as a module
```sh
module "service-listner" {
source   = "../modules/alb_listener_rule"
target_listner80  = "${module.service-tg.target_listner80}"
target_listner443  = "${module.service-tg.target_listner443}"
target_group_arn  = "${module.service-tg.target_group_arn}"
host              =   "${var.dns_record}"
priority    =  "3"
}
```
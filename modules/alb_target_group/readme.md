# Module tg

### Referenced in
- module ecs

### Resources
- TG
- aws_alb_listener 80,443
- healtcheck

### Input
```sh
variable "name" {
  description = "AWS ALB Name"
}

variable "http_code" {
  description = "HTTP Code for health check"
}

variable "environment" {
  description = "Environment Name"
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
```

### How to use with variables.tfvats
```sh
vpc_id                = ""
alb_arn               = "ARN"
cert_acm_arn          = "CERTIFICATE ARN"
alb_check_path        = "/"
alb_port              = "80"
environment           = "playground"
http_code             = 200
name                  = "test"
```

### How to use with modules
```sh
module "miyazaki-tg" {
  source         = "../modules/tg"
  name           = "tg-name(service_name)"
  http_code      = "200"
  alb_port       = "80"
  alb_check_path = "/2.0/health"
  entity         = "${var.entity}"
  environment    = "${var.environment}"
  cert_acm_arn   = "${var.cert_acm_arn}"
  alb_arn        = "${module.miyazaki-alb.alb_arn}"
  vpc_id         = "vpc-id"
}```

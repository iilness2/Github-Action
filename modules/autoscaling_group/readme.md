# Module asg_elb (Auto scaling group with Elastic/Classic load balancer)

This module will create the auto scaling group with  compulsary attaching the instances to a target group.

## List of the resources
- aws_autoscaling_group

### Inputs
```sh
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
    description = "Desired no of instances in the asg can be possible"
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
  type = "list"
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
```

### How to use as variables.tfvars
```sh
name = ""
region = ""
launch_configuration = ""
elb_names = [""]
desired_capacity = ""
application = ""
max_size = ""
min_size = ""
availability_zones = [""]
application = ""
entity = ""
subnet_ids = [""]
environment = ""
logrotate = ""
```

### How to use as a module
```sh
module "asg" {
  source               = "../modules/asg_elb"
  name                 = "ASG Name"
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  desired_capacity     = "2"
  application          = "Application Name"
  logrotate            = "Yes"
  entity               = "${var.entity}"
  region               = "${var.region}"
  environment          = "${var.environment}"
  availability_zones   = "${var.availability_zones}"
  launch_configuration = "${module.lc.launch_configuration}"
  vpc_id               = "${var.vpc_id}"
  subnet_ids           = "${var.cluster_subnet_ids}"
  application-type     = ""
  elb_names            = ""
}
```
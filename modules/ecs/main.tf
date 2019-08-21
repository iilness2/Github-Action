provider "aws" {
  shared_credentials_file = "~/.aws/config"
  profile = "hooq-play"
}
resource "aws_ecs_cluster" "main" {
  name = var.name

  lifecycle {
    create_before_destroy = true
  }
}

module "lc_main" {
  source          = "../lc"
  name            = var.name
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_groups
  role_name       = var.instance_role
  userdata        = var.userdata
  ami_id          = var.ami_id
}

module "service-alb" {
  source                           = "../alb"
  name                             = var.name
  internal_lb_value                = var.internal_loadbalancer
  entity                           = var.entity
  environment                      = var.environment
  subnet_ids                       = var.subnet_ids
  security_groups                  = var.security_groups
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = var.enable_http2
  access_log_bucket_name           = var.access_log_bucket_name
  enable_access_log                = var.enable_access_log
}

module "service-tg" {
  source         = "../tg"
  vpc_id         = var.vpc_id
  alb_arn        = module.service-alb.alb_arn
  cert_acm_arn   = var.cert_acm_arn
  alb_check_path = var.alb_check_path
  alb_port       = var.alb_port
  environment    = var.environment
  http_code      = var.http_code
  name           = var.name
}

# The auto scaling group that specifies how we want to scale the number of EC2 Instances
resource "aws_autoscaling_group" "main" {
  name                 = "${var.name}-asg"
  availability_zones   = var.availability_zones
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = module.lc_main.launch_configuration_name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  health_check_type    = "EC2"
  enabled_metrics      = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  termination_policies = ["OldestLaunchConfiguration", "Default"]

  #target_group_arns    = "${var.target_group_arn}"

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "${var.name}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Entity"
    value               = var.entity
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "application"
    value               = var.application
    propagate_at_launch = true
  }
}

# User data template that specifies how to bootstrap each instance
data "template_file" "container_definitions" {
  template = file("files/task-definitions/td.json")

  vars = {
    cluster_name         = var.name
    mount_path           = var.mount_path
    mount_path_name      = var.volume_name
    container_port       = var.container_port
    awslogs_group        = var.awslogs_group
    docker_tag           = var.docker_tag
    docker_image         = var.docker_image
    region               = var.region
    host_port            = var.host_port
    container_name       = var.container_name
    instance_volume_path = var.instance_volume_path
    volume_name          = var.volume_name
  }
}

resource "aws_ecs_task_definition" "main" {
  family                = "${var.name}-td"
  container_definitions = data.template_file.container_definitions.rendered

  volume {
    name      = var.volume_name
    host_path = var.instance_volume_path
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [ap-southeast-1a, ap-southeast-1b]"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_ecs_service" "main" {
  deployment_minimum_healthy_percent = "100"
  deployment_maximum_percent         = "200"
  iam_role                           = "ecsServiceRole"
  name                               = "${var.name}-service"
  desired_count                      = var.desired_count
  cluster                            = aws_ecs_cluster.main.id

  load_balancer {
    target_group_arn = module.service-tg.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  # Track the latest ACTIVE revision
  task_definition = "${aws_ecs_task_definition.main.family}:${max(aws_ecs_task_definition.main.revision)}"
}
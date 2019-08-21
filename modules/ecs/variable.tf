variable "name" {
  description = "This name will be used for all resources, e.g. alb, tg, lc, asg, service, cluster"
}

variable "desired_count" {
  description = "No of desired tasks in service"
}

variable "region" {
  description = "AWS Region, e.g us-west-2"
}

variable "volume_name" {
  description = "A set of volume blocks that containers in your task may use"
}

variable "mount_path" {
  description = "Which host part to be mount to the volume name"
}

variable "instance_type" {
  description = "Instance type e.g. t2-micro"
}

variable "ami_id" {
  description = "AMI id"
}

variable "container_name" {
  description = "Container name for the load healch check paths from tg"
}

variable "container_port" {
  description = "Container port for the load healch check port from tg"
}

variable "instance_role" {
  description = "IAM role for launch config for all ec2 instances"
}

variable "key_name" {
  description = "Key name for launch config"
}

variable "instance_volume_path" {
  description = "Host volume path to be mount with containers"
}

variable "userdata" {
  description = "userdata file path, it will add clustername in ecs agent file. File path should be in format 'files/user_data/userdata.sh'"
}

variable "desired_capacity" {
  description = "Desired capacity for asg"
}

variable "max_size" {
  description = "MAX capacity for asg"
}

variable "min_size" {
  description = "MIN capacity for asg"
}

variable "availability_zones" {
  description = "AZ for ASG, In which AZ ASG needs to be created"
  type        = list(string)
}

variable "application" {
  description = "ASG TAG"
}

variable "entity" {
  description = "ASG TAG"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "A external subnet id"
  type        = list(string)
}

variable "security_groups" {
  type        = list(string)
  description = "A list of subnet IDs"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "docker_image" {
  description = "docker image for ecs container"
}

variable "docker_tag" {
  description = "docker image tag"
}

variable "awslogs_group" {
  description = "TD aws log group"
}

variable "host_port" {
  description = "Host port. 0 port signify dinamically port for host machine, e.g. 0"
}

variable "internal_loadbalancer" {
  description = "boolean value for loadbalancer. Is this a internal loadblanacer"
}

variable "enable_cross_zone_load_balancing" {
  description = "Is this load balancer is enableed for cross_zone_load_balancing"
}

variable "enable_http2" {
  description = "is http2 protocall enable for loadbalancer"
}

variable "access_log_bucket_name" {
  description = "access log bucker name for the load balancer for pushing logs of loadbalancer"
}

variable "enable_access_log" {
  description = "is access logs enable for loadbalancer to push on s3 bucket"
}

variable "cert_acm_arn" {
  description = "ssl certificate arn, will be applied on 443 rule"
}

variable "alb_check_path" {
  description = "Health check path for target group"
}

variable "alb_port" {
  description = "Port mapping for target group"
}

variable "http_code" {
  description = "health check status code, e.g. 200"
}


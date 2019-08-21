/**
 * Getting the miyazaki network tfstate file.
 */
data "terraform_remote_state" "miyazaki-network" {
  backend = "s3"

  config = {
    bucket = var.tf-state-bucket-name
    key    = "${var.tf-state-environment}/ap-southeast-1/miyazaki/network/terraform.tfstate"
    region = var.tf-state-region
  }
}

/**
 * Creating the empty cluster.
 */
module "miyazaki-cluster" {
  source = "../../../modules/ecs_cluster"
  name   = var.cluster-name

  ### Tags
  environment  = var.environment
  entity       = var.entity
  managedby    = var.managedby
  service-name = var.service-name
  owner        = var.owner
  versions     = var.versions
}

/**
 * Creating the application load balancer INTERNAL
 */
module "miyazaki-alb" {
  source                           = "../../../modules/alb"
  name                             = var.service-name
  enable-access-log                = var.enable-access-log
  enable-cross-zone-load-balancing = var.enable-cross-zone-load-balancing
  enable-http2                     = var.enable-http2
  access-log-bucket-name           = ""
  internal-lb-value                = var.internal-lb-value
  subnet-ids                       = data.terraform_remote_state.miyazaki-network.outputs.vpc-internal-lb-subnets
  security-groups                  = [data.terraform_remote_state.miyazaki-network.outputs.vpc-default-security_group]

  ### Tags
  entity       = var.entity
  environment  = var.environment
  managedby    = var.managedby
  owner        = var.owner
  service-name = var.service-name
  versions     = var.versions
}

module "miyazaki-tg" {
  name           = var.service-name
  source         = "../../../modules/tg"
  alb_arn        = module.miyazaki-alb.alb-arn
  alb_check_path = var.alb-health-check-path
  alb_port       = var.alb-target-group-port
  vpc_id         = data.terraform_remote_state.miyazaki-network.outputs.vpc-id
  http_code      = var.http-code
  cert_acm_arn   = var.cert-arn

  ### Tags
  environment  = var.environment
  owner        = var.owner
  entity       = var.entity
  managedby    = var.managedby
  service-name = var.service-name
  versions     = var.versions
}

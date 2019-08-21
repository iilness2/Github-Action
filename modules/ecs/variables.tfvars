
name                    = "play-testing"

### Load balancer variables
internal_loadbalancer   = true
enable_cross_zone_load_balancing    = false
enable_http2            = true
access_log_bucket_name  = "test"
enable_access_log       = false

### Launch Config variables
instance_role           = "terraform"
key_name                = "hooq-play-test"
userdata                = "userdata.sh"
security_groups         = ["sg-0dcbd570"]
region                  = "ap-southeast-1"
instance_type           = "t2-micro"
ami_id                  = "ami-0bb35a5dad5658286"


### ASG variables
max_size                = "10"
min_size                = "2"
desired_capacity        = "2"
availability_zones      = ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
vpc_id                  = "vpc-9ba19ffc"
subnet_ids              = ["subnet-bde604db","subnet-1eb26b47","subnet-b49083fd"]
### Tags
  environment             = "playground"
  application             = "miyazaki"
  entity                  = "hooq"



### Task defination variables
volume_name             = "test"
instance_volume_path    = "/var/log/test-instance-volume-path"
mount_path              = "/var/log/test-mounthpath"
container_name          = "test"
container_port          = "80"
docker_image            = "image"
docker_tag              = "test"
awslogs_group           = "test"
host_port               = "0"

desired_count           = "2"

### Target Group variables
cert_acm_arn            = "test"
alb_check_path          = "/"
alb_port                = "80"
http_code               = "200"


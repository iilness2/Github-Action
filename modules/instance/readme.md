# Module EC2

### Resources
- EC2 instance

### Inputs
```sh
variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type, see a list at: https://aws.amazon.com/ec2/instance-types/"
}

variable "name" {
  description = "Instance Name, will be attached to Tags"
}

variable "key_name" {
  description = "KeyName to launch the instance"
}

variable "user_data" {
  description = "User data, after reding the file, If not provided will be passing the empity file"
}

variable "region" {
  description = "AWS Region, e.g us-west-2"
}

variable "application" {
  description = "Applicatio name, e.g. Hooq. Will be passed in tags"
}

variable "application-type" {
  description = "Type of the application, will be passed in the tags"
}

variable "entity" {
  description = "Will be passed in tags"
}

variable "security_groups" {
  type = "list"
  description = "list of security group."
}

variable "ami_id" {
  description = "AMI ID"
}

variable "subnet_id" {
  description = "A external/internal subnet id"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}
```

### How to use with variables.tfvars
```sh
instance_type         = "t2.micro"
name                  = "test-ec2-instance"
key_name              = "KeyName"
entity                = "N/A"
user_data             = "" # "file("filename.sh")"
region                = "ap-southeast-1"
application           = "Application Name"
application-type      = "Applucation type"
security_groups       = ["sg-id","sg-id"]
ami_id                = "ami-id"
subnet_id             = "subnet-id"
environment           = "Env Name"
```

### How to use with a module
```sh
  module "ec2-instance" {
  source           = "../modules/ec2"
  instance_type    = "t2.medium"
  ami_id           = "ami-fb6d2087"
  application      = "Elasticsarch"
  application-type = "Platform"
  region           = "${var.region}"
  entity           = "${var.entity}"
  key_name         = "${var.key_name}"
  environment      = "${var.environment}"
  private_ip       = "X.X.X.X"
  name             = "hooq-loadtesting-sanctuary-elasticsarch"
  vpc_id           = "${data.terraform_remote_state.base_infra.vpc_id}"
  security_groups  = "${data.terraform_remote_state.base_infra.internal_elasticache_sg}"
  subnet_id        = "${element(data.terraform_remote_state.base_infra.internal_subnets, 0)}"
}
```

### Command
```sh
terraform init
terraform plan -var-file="variables.tfvars"
terraform apply -var-file="variables.tfvars"
```
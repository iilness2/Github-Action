# Module Launch Config

### Reference used in
- ECS Module

### Resources
- LC

### Inputs
```sh
variable "name" {
  description = "Launch Config name"
}

variable "instance_type" {
  description = "Instance type"
}

variable "key_name" {
  description = "SSH Key used for EC2"
}

variable "security_groups" {
  description = "Security group to be attached on instance"
  type        = list(string)
}

variable "role_name" {
  description = "IAM Role Name for Instance"
}

variable "userdata" {
  default     = ""
  description = "Userdata shell file name for instance. File path should be in the format of 'files/user_data/userdata_filename' Do not delete the default field option"
}

variable "ami_id" {
  description = "AMI For Launch Config"
}

```

### How to used with variables.tfvars
```sh
name                    = "test"
instance_type           = "t2.micro"
key_name                = "test"
security_groups         = ["id1","id2"]
role_name               = "ecsrole"
userdata                = "userdata.sh"
ami_id                  = "ami"
```

### How to used with modules
```sh
  module "playapi-lc" {
  source          = "../modules/lc"
  instance_type   = "t2.medium"
  ami_id          = "ami-90dd83ec"
  userdata        = "userdata.sh"
  key_name        = "${var.key_name}"
  role_name       = "${var.role_name}"
  name            = "lc-name"
  security_groups = "securoty group id"
}
```
variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type, see a list at: https://aws.amazon.com/ec2/instance-types/"
}

variable "name" {
  description = "Instance Name, will be attached to Tags"
}

variable "private_ip" {
  description = "Private IP for the instance"
}

variable "key_name" {
  description = "KeyName to launch the instance"
}

variable "user_data" {
  default = ""
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


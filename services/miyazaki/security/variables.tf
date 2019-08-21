variable "tf-state-region" {
  description = "AWS region for tfstate"
}

variable "tf-state-environment" {
  description = "s3 bucket file pattern for environment"
}

variable "tf-state-bucket-name" {
  description = "s3 bucket name for network tfstate"
}

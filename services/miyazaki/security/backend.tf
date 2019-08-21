terraform {
  backend "s3" {
    bucket = "hooq-terraform-remote-state"
    key    = "ap-southeast-1/miyazaki/security/terraform.tfstate"
    region = "ap-southeast-1"
  }
}


terraform {
  backend "s3" {
    bucket = "hooq-play-terraform-remote"
    key    = "ap-southeast-1/miyazaki/application/terraform.tfstate"
    region = "ap-southeast-1"
  }
}


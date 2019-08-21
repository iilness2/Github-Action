data "terraform_remote_state" "miyazaki-network" {
  backend = "s3"

  config = {
    bucket = "hooq-play-terraform-remote"
    key    = "env:/playground/ap-southeast-1/miyazaki/network/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.terraform_remote_state.miyazaki-network.outputs.vpc-default-security_group

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "-1"
    cidr_blocks = ["182.73.209.70/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


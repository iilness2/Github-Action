resource "aws_instance" "main" {
  ami                    = var.ami_id
  source_dest_check      = false
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
  monitoring             = true
  private_ip             = var.private_ip
  user_data              = var.user_data == "" ? file(format("%s/user_data.sh", path.module)) : var.user_data

  tags = {
    Name             = var.name
    Environment      = var.environment
    Entity           = var.entity
    ManagedBy        = "CloudCover"
    Application      = var.application
    Application-Type = var.application-type
  }
}


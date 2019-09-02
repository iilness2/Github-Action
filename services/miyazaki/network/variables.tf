variable "azd" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}
variable "env" {
  default = {
    Dev = {
      vpc-name          = "miyazaki_dev"
      cidr              = "172.16.0.0/22"
      cidrs_public      = "172.16.0.0/26,172.16.0.64/26,172.16.0.128/26"
      cidrs_private     = "172.16.0.192/26,172.16.1.0/26,172.16.1.64/26"
      cidrs_elasticache = "172.16.1.128/26,172.16.1.192/26,172.16.2.0/26"
      #      nat-gateway        = "false"
      #      single-nat-gateway = "false"
    }
    Prd = {
      vpc-name          = "miyazaki_prd"
      cidr              = "10.0.0.0/18"
      cidrs_public      = "10.0.0.0/23,10.0.2.0/23,10.0.4.0/23"
      cidrs_private     = "10.0.6.0/23,10.0.8.0/23,10.0.10.0/23"
      cidrs_elasticache = "10.0.12.0/23,10.0.14.0/23,10.0.16.0/23"
      #      nat-gateway        = "true"
      #      single-nat-gateway = "true"
    }
  }
}

variable "service-name" {
  description = "Tag: Service Name for all resources"
  default     = "miyazaki"
}
variable "owner" {
  description = "Tag: Owner of the resources"
  default     = "miyazaki"
}

variable "tag" {
  default = {
    Dev = {
      version = "0.1"
    }
    Prd = {
      version = "0.1"
    }
  }
}





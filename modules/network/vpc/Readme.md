# Terraform modules - VPC

VPC modules are containing the following AWS resources.
- VPC
- Subnets
    - Internal-EC2
    - external-EC2
    - Internal-db
    - External-db
    - Internal-lb
    - External-lb
- Internet Gateway
- NAT Gateway (Created in the first defined public subnet)
- Elastic IP (Attached to NAT)
- Route Table - Internal (All traffic to NAT)
- Route Table - External (All traffic to IG)
- Route Table association 
    - All internal subnets associated with the internal route table.  
    - All external subnets associated with the external route table.

### Note- 
    If the number of availability zone is less then no of subnets to create then new subnet will create in the first availability zone.
    
    Example 1:
        subnets - subnet1, subnet2, subnet3
        availability zona - ap-southeast-1, apsoutheast-2
        subnet1 -> ap-southeast-2
        subnet2 -> ap-southeast-1
        subnet3 -> ap-southeast-2
        
    Example 2:
        subnets - subnet1, subnet2, subnet3
        availability zona - ap-southeast-1, apsoutheast-2, ap-southwast-3
        subnet1 -> ap-southeast-2
        subnet2 -> ap-southeast-3
        subnet3 -> ap-southeast-1



### Input Variables
```sh
variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "entity" {
  description = "The CIDR block for the VPC."
}

variable "external_subnets" {
  description = "List of external subnets"
  type        = "list"
}
variable "external_subnetsdb" {
  description = "List of external subnets"
  type        = "list"
}

variable "external_subnetslb" {
  description = "List of external subnets"
  type        = "list"
}

variable "internal_subnets" {
  description = "List of internal subnets"
  type        = "list"
}

variable "internal_subnetsdb" {
  description = "List of internal subnets"
  type        = "list"
}

variable "internal_subnetslb" {
  description = "List of internal subnets"
  type        = "list"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = "list"
}

variable "vpc_name" {
  description = "Name tag e.g stack"
}
```

### Output Variables
```sh
// The VPC ID
output "id" {
  value = "${aws_vpc.main.id}"
}

// The VPC CIDR
output "cidr_block" {
  value = "${aws_vpc.main.cidr_block}"
}

// The default VPC security group ID.
output "security_group" {
  value = "${aws_vpc.main.default_security_group_id}"
}

// The list of availability zones of the VPC.
output "availability_zones" {
  value = ["${aws_subnet.external.*.availability_zone}"]
}

// The internal route table ID.
output "internal_rtb_id" {
  value = "${join(",", aws_route_table.internal.*.id)}"
}

// The external route table ID.
output "external_rtb_id" {
  value = "${aws_route_table.external.id}"
}

// The list of EIPs associated with the internal subnets.
output "internal_nat_ips" {
  value = ["${aws_eip.nat-ip.*.public_ip}"]
}

// A comma-separated list of subnet IDs.
output "external_subnets" {
  value = ["${aws_subnet.external.*.id}"]
}

// A list of subnet IDs.
output "internal_subnets" {
  value = ["${aws_subnet.internal.*.id}"]
}

output "internal_subnets_db" {
  value = ["${aws_subnet.internaldb.*.id}"]
}

output "external_subnets_db" {
  value = ["${aws_subnet.externaldb.*.id}"]
}
output "internal_subnets_lb" {
  value = ["${aws_subnet.internallb.*.id}"]
}

output "external_subnets_lb" {
  value = ["${aws_subnet.externallb.*.id}"]
}
```


### How to use this module
    Use this code in your main.tf file
```sh
module "vpc" {
  source = "../modules/vpc"
  cidr  = "${var.cidr}"
  entity  = "${var.entity}"
  external_subnets = "${var.external_subnets}"
  external_subnetsdb = "${var.external_subnetsdb}"
  external_subnetslb = "${var.external_subnetslb}"
  internal_subnets = "${var.internal_subnets}"
  internal_subnetsdb = "${var.internal_subnetsdb}"
  internal_subnetslb= "${var.internal_subnetslb}"
  environment = "${var.environment}"
  availability_zones = "${var.availability_zones}"
  vpc_name = "${var.vpc_name}"
  managedby = "${var.managedby}"
}
```
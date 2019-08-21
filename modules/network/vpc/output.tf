// The VPC ID
output "id" {
  value = aws_vpc.main.id
}

// The VPC CIDR
output "cidr-block" {
  value = aws_vpc.main.cidr_block
}

// The default VPC security group ID.
output "vpc-default-security_group" {
  value = aws_vpc.main.default_security_group_id
}
output "vpc-defaule-route-table" {
  value = aws_vpc.main.default_route_table_id
}
// The list of availability zones of the VPC.

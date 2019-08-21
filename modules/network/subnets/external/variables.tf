variable "availability-zones" {
  description = "List of availability zones"
  type        = "list"
}
variable "vpc-id" {
  description = "VPC ID"
}
variable "vpc-name" {
  description = "VPC-Name"
}
variable "subnets-cidr" {
  description = ""
}
### Tags
variable "versions" {
  description = "Tag: Version for all resources"
}
variable "owner" {
  description = "Tag: Will be attached to instance as a tag. Will indicate who will be the owner for the resources."
}
variable "managedby" {
  description = "Tag: Who is managing the resource"
}
variable "environment" {
  description = "Tag: Environment tag, e.g prod"
}
variable "entity" {
  description = "Tag: The CIDR block for the VPC."
}
variable "service-name" {
  description = "Tag: Service Name for all resources"
}
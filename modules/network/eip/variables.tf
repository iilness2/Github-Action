variable "vpc-name" {
  description = "Tag: VPC Name"
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
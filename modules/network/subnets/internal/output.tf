// A list of subnet IDs.
output "subnets-main-internal" {
  value = sort(aws_subnet.main.*.id)
}
output "availability-zones-internal" {
  value = sort(aws_subnet.main.*.availability_zone)
}
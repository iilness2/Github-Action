// A list of subnet IDs.
output "subnets-main-external" {
  value = sort(aws_subnet.main.*.id)
}
output "availability-zones-external" {
  value = sort(aws_subnet.main.*.availability_zone)
}
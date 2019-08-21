output "nat-id" {
  value = aws_nat_gateway.main.id
}
output "nat-ip" {
  value = aws_nat_gateway.main.public_ip
}
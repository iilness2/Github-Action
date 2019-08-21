## Creating the internet gateway
resource "aws_route" "main" {
  route_table_id         = var.rt-id
  destination_cidr_block = var.destination-cidr
  gateway_id             = var.ig-id
}
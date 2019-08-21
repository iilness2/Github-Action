output "alb-name" {
  value = aws_alb.main.name
}

output "alb-arn" {
  value = aws_alb.main.arn
}

output "dns-name" {
  value = aws_alb.main.dns_name
}

output "alb-arn-suffix" {
  value = aws_alb.main.arn_suffix
}

output "alb-zone-id" {
  value = aws_alb.main.*.zone_id
}


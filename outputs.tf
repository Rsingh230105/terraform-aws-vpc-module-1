output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "Map of public subnet IDs and availability zones"
  value       = local.public_subnet_output
}

output "private_subnets" {
  description = "Map of private subnet IDs and availability zones"
  value       = local.private_subnet_output
}

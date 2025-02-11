output "az_info" {
  value = data.aws_availability_zones.az
}

output "subnets_info" {
  value=aws_subnet.public
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet" {
  value = aws_subnet.public[*].id
}

output "private_subnet" {
    value=aws_subnet.private[*].id
}

output "database_subnet" {
  value=aws_subnet.Database_cidr[*].id
}
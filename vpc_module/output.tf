output "aws_vpc" {
  value = aws_vpc.vpc
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.igw
}

output "aws_nat_gateway" {
  value = aws_nat_gateway.nat_gateway
}

output "subnet_isolated" {
  value = aws_subnet.isolated
}

output "subnet_private" {
  value = aws_subnet.private
}

output "subnet_public" {
  value = aws_subnet.public
}

output "aws_route_table_public" {
  value = aws_route_table.public
}

output "aws_route_table_private" {
  value = aws_route_table.private
}

output "aws_route_table_isolated" {
  value = aws_route_table.isolated
}
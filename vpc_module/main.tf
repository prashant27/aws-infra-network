
provider "aws" {
  region = var.region  # Use region from variable
}

# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block             = var.vpc_cidr_block
  enable_dns_support     = true
  enable_dns_hostnames   = true

  tags = {
    Name = var.vpc_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {}


# Create NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public["public-subnet-1"].id

  tags = {
    Name = var.nat_gateway_name
  }
}


# Private Subnet
resource "aws_subnet" "private" {
  for_each = { for k, v in var.subnet_definitions : k => v if !v.public && !lookup(v, "isolated", false) }

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${each.value.az}-private-subnet"
  }
}

# Isolated Subnets
resource "aws_subnet" "isolated" {
  for_each             = { for k, v in var.subnet_definitions : k => v if lookup(v, "isolated", false) }
  vpc_id               = aws_vpc.vpc.id
  cidr_block           = each.value.cidr
  availability_zone    = each.value.az

  tags = {
    Name = "${each.value.az}-isolated-subnet"
  }
}

# public Subnets
resource "aws_subnet" "public" {
  for_each = { for k, v in var.subnet_definitions : k => v if v.public }

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${each.value.az}-public-subnet"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "public-route-table"
  }
  
}

# Associate Route Table with Public Subnets
resource "aws_route_table_association" "public_subnets" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# Route Table for private Subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

# Associate Route Table with Private Subnets
resource "aws_route_table_association" "private_subnets" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

# Route Table for Isolated Subnets
resource "aws_route_table" "isolated" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "isolated-route-table"
  }
}

# Associate Route Table with Isolated Subnets
resource "aws_route_table_association" "isolated_subnets" {
  for_each       = aws_subnet.isolated
  subnet_id      = each.value.id
  route_table_id = aws_route_table.isolated.id
}

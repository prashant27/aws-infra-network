region             = "us-east-1"
vpc_name               = "vpc_ipgp"
igw_name           = "igw_ipgp"
nat_gateway_name   = "nat_gateway_ipgp"
destination_cidr_block = "0.0.0.0/0"
isolated_route_table = "rt_isolated"
vpc_cidr_block     = "10.240.12.0/22"

subnet_definitions = {
  "public-subnet-1" = {
    cidr    = "10.240.12.0/25"
    az      = "us-east-1a"
    public  = true
    isolated = false
  }
  "public-subnet-2" = {
    cidr    = "10.240.12.128/25"
    az      = "us-east-1b"
    public  = true
    isolated = false
  }
  "private-subnet-1" = {
    cidr    = "10.240.14.0/24"
    az      = "us-east-1a"
    public  = false
    isolated = false
  }
  "private-subnet-2" = {
    cidr    = "10.240.15.0/24"
    az      = "us-east-1b"
    public  = false
    isolated = false
  }
  "isolated-subnet_1" = {
    cidr     = "10.240.13.0/25"
    az       = "us-east-1a"
    public   = false
    isolated = true
  }
  "isolated-subnet_2" = {
    cidr     = "10.240.13.128/25"
    az       = "us-east-1b"
    public   = false
    isolated = true
  }
}

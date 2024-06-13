
module vpc_module {
  source = "./vpc_module"
  vpc_cidr_block         = var.vpc_cidr_block
  vpc_name = var.vpc_name
  region = var.region
  igw_name = var.igw_name
  nat_gateway_name = var.nat_gateway_name
  destination_cidr_block = var.destination_cidr_block
  subnet_definitions = var.subnet_definitions
}
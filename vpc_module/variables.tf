variable "region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "igw_name" {
  description = "Internat gateway name"
  type        = string
}

variable "nat_gateway_name" {
  description = "Internat gateway name"
  type        = string
}

variable "destination_cidr_block" {
  description = "Internat gateway name"
  type        = string
}

variable "subnet_definitions" {
  description = "Subnet definitions"
  type = map(object({
    cidr   = string
    az     = string
    public = bool
    isolated = bool
  }))
}
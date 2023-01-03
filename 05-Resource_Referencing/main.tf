resource "aws_vpc" "terraform_test_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "terraform_test_vpc"
  }
}

resource "aws_subnet" "terraform_test_subnet" {
  vpc_id     = aws_vpc.terraform_test_vpc.id
  cidr_block = "172.31.0.0/24"
  tags = {
    Name = "terraform_test_subnet"
  }
}

resource "aws_internet_gateway" "terraform_test_internet_gateway" {
  // Here this IGW resource will be created in the VPC created in this file itself.
  vpc_id = aws_vpc.terraform_test_vpc.id

  tags = {
    Name = "terraform_test_internet_gateway"
  }
}
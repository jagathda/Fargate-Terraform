provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "fargate_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "FargateVPC"
  }
}

# Create public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.fargate_vpc.id
  cidr_block        = var.public_subnet_cidr_1
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.fargate_vpc.id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = "${var.region}b"
}


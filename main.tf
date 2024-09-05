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

# Create an Internet Gateway
resource "aws_internet_gateway" "fargate_igw" {
  vpc_id = aws_vpc.fargate_vpc.id
}

# Route Table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.fargate_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fargate_igw.id
  }
}

# Associate route table with subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}
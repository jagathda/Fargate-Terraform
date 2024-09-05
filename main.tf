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

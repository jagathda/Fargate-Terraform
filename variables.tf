variable "region" {
  description = "AWS region"
  default     = "eu-north-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "Public subnet CIDR block 1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "Public subnet CIDR block 2"
  default     = "10.0.2.0/24"
}

variable "cluster_name" {
  description = "ECS cluster name"
  default     = "Fargate_Cluster"
}
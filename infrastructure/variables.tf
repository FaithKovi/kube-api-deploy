variable "vpc_name" {
  description = "value of the VPC name"
  type = string
}

variable "vpc_cidr_block" {
  description = "value of the VPC CIDR block"
  type = string
}
  
variable "private_subnet_cidr_block" {
  description = "List of private subnet CIDR blocks"
  type = list(string)
}
  
variable "public_subnet_cidr_block" {
  description = "List of public subnet CIDR blocks"
  type = list(string)
}

variable "aws_region" {
  description = "value of the region"
  type = string
}
  
variable "cluster_name" {
  description = "value of the EKS cluster name"
  type = string
}

variable "instance_type" {
  description = "value of the instance type"
  type = string
}

variable "environment" {
  description = "value of environment name"
  type = string
}

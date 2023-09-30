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

variable "azs" {
  description = "value of availability zones"
  type = list(string)
}

variable "from_port" {
    description = "value of from port"
    type = number
}

variable "to_port" {
    description = "value of to port"
    type = number
}

variable "rule" {
  description = "value of the rule"
  type = string
}

variable "ports" {
  description = "value of ports"
  type = string
}

variable "security_group_name" {
  description = "value of the security group name"
  type = string
}

variable "application_name" {
  description = "value of the application name"
  type = string
}

variable "cluster_version" {
  description = "value of the cluster version"
  type = string
}

variable "region" {
  description = "value of the region"
  type = string
}



variable "vpc_name" {
  description = "value of vpc name"
  type = string
}

variable "vpc_cidr_block" {
  description = "value of vpc cidr block"
  type = string
}

variable "private_subnet_cidr_block" {
  description = "value of private subnet cidr block"
  type = list(string)
}

variable "public_subnet_cidr_block" {
  description = "value of public subnet cidr block"
  type = list(string)
}

variable "availability_zones" {
  description = "value of availability zones"
  type = list(string)
}

variable "cluster_name" {
  description = "value of cluster name"
  type = list(string)
}
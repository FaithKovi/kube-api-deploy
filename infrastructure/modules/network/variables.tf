variable "vpc_cidr_block" {
  description = "value of the VPC CIDR block"
}
  
variable "public_subnet_cidr_block" {
  description = "List of public subnet CIDR blocks"
  type = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type = list(string)
}

variable "map_public_ip_on_launch" {
  description = "value of the map public ip on launch"
  type = bool
}

variable "ingress_from_port" {
  description = "value of the ingress from port"
  type = number
}

variable "egress_from_port" {
  description = "value of the egress from port"
  type = number
}

variable "ingress_to_port" {
  description = "value of the ingress to port"
  type = number
}

variable "egress_to_port" {
  description = "value of the egress to port"
  type = number 
}

variable "ingress_protocol" {
  description = "value of the ingress protocol"
  type = string
}

variable "egress_protocol" {
  description = "value of the egress protocol"
  type = string
}

variable "vpc_cidr_block" {
  description = "value of the VPC CIDR block"
}

variable "cluster_security_group_name" {
  description = "value of the EKS cluster security group name"
}

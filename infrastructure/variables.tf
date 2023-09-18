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
  


  
# variable "availability_zones" {
#   description = "List of availability zones"
#   type = list(string)
# }
  


# variable "aws_region" {
#   description = "value of the region"
#   type = string
# }

# variable "cluster_name" {
#   description = "value of the EKS cluster name"
# }
  
# variable "cluster_version" {
#   description = "value of the cluster version"
# }

# variable "vpc_name" {
#   description = "value of the VPC name"
# }
  
# variable "availability_zones" {
#   description = "List of availability zones"
#   type = list(string)
# }
# # variable "cluster_security_group_id" {
# #   description = "value of the EKS cluster security group id"
# # }

# # variable "vpc_id" {
# #   description = "value of the vpc id"
# # }

# # variable "subnets" {
# #   description = "List of subnet ids for the EKS cluster"
# #   type = list(string)
# # }

# variable "workers_desired_capacity" {
#   description = "value of the workers desired capacity in the node group"
#   type = number
# }

# variable "egress_to_port" {
#   description = "value of the egress to port"
#   type = number 
# }

# variable "egress_from_port" {
#   description = "value of the egress from port"
#   type = number
# }
  
# variable "map_public_ip_on_launch" {
#   description = "value of the map public ip on launch"
#   type = bool
# }

# variable "vpc_cidr_block" {
#   description = "value of the VPC CIDR block"
#   type = string
# }
  


# variable "cluster_security_group_name" {
#   description = "value of the EKS cluster security group name"
#   type = string
# }

# variable "public_subnet_cidr_block" {
#   description = "List of public subnet CIDR blocks"
#   type = list(string)
# }
  
# variable "ami_type" {
#   description = "value of the AMI type for the node group"
#   type = string
# }
  

  
# variable "instance_type" {
#   description = "value of the instance type for the node group"
#   type = string
# }

# variable "ingress_from_port" {
#   description = "value of the ingress from port"
#   type = number
# }
  
  
# variable "ingress_to_port" {
#   description = "value of the ingress to port"
#   type = number
# }
  
# variable "max_capacity" {
#   description = "value of the workers max capacity in the node group"
#   type = number
# }

# variable "min_capacity" {
#   description = "value of the workers min capacity in the node group"
#   type = number
# }
  

# variable "ingress_protocol" {
#   description = "value of the ingress protocol"
#   type = string
# }

# variable "egress_protocol" {
#   description = "value of the egress protocol"
#   type = string
# }
  
# variable "public_subnet_name" {
#   description = "List of public subnet names"
#   type = list(string)
# }
  


  

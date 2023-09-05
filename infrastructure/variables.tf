variable "aws_region" {
  description = "value of the region"
}

variable "cluster_name" {
  description = "value of the EKS cluster name"
}
  
variable "cluster_version" {
  description = "value of the cluster version"
}

variable "cluster_security_group_id" {
  description = "value of the EKS cluster security group id"
}

variable "vpc_id" {
  description = "value of the vpc id"
}

variable "subnets" {
  description = "List of subnet ids for the EKS cluster"
  type = list(string)
}

variable "workers_desired_capacity" {
  description = "value of the workers desired capacity in the node group"
  type = number
}

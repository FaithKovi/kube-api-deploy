variable "cluster_name" {
  description = "value of the EKS cluster name"
}
  
variable "cluster_version" {
  description = "value of the Kubernetes version for the cluster"
}
  
variable "subnets" {
  description = "List of subnet ids for the EKS cluster"
  type = list(string)
}
  
variable "vpc_id" {
  description = "value of the vpc id for the EKS cluster"
}

variable "workers_desired_capacity" {
  description = "value of the workers desired capacity in the node group"
  type = number
}

variable "max_capacity" {
  description = "value of the workers max capacity in the node group"
  type = number
}

variable "min_capacity" {
  description = "value of the workers min capacity in the node group"
  type = number
}
  
variable "instance_type" {
  description = "value of the instance type for the node group"
  type = string
}

variable "ami_type" {
  description = "value of the AMI type for the node group"
  type = string
}
  

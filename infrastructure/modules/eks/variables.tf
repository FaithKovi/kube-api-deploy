variable "cluster_name" {
  description = "value of cluster name"
  type        = string
}

variable "cluster_version" {
  description = "value of cluster version"
  type        = string
}

variable "instance_type" {
  description = "value of instance type"
  type        = string
}

variable "asg_desired_capacity" {
  description = "value of asg desired capacity"
  type        = string
}

variable "asg_max_size" {
  description = "value of asg max size"
  type        = string
}

variable "asg_min_size" {
  description = "value of asg min size"
  type        = string
}


variable "environment" {
  description = "value of environment name"
  type        = string
}

variable "application_name" {
  description = "value of application name"
  type        = string
}
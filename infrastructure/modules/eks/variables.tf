variable "cluster_name" {
  description = "value of cluster name"
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "value of cluster endpoint public access"
  type        = bool
}

variable "ami_type" {
  description = "value of ami type"
  type        = string
}

variable "instance_types" {
  description = "value of instance types"
  type        = list(string)
}

variable "min_size" {
  description = "value of worker group min size"
  type        = number
}

variable "max_size" {
  description = "value of worker group max size"
  type        = number
}

variable "desired_size" {
  description = "value of desired size"
  type        = number
}

variable "from_port" {
  description = "value of from port"
  type        = number
}

variable "to_port" {
  description = "value of to port"
  type        = number
}

variable "protocol" {
  description = "value of protocol"
  type        = string
}
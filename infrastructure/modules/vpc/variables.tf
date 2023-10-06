variable "vpc_name" {
  description = "value of vpc name"
  type        = string
}

variable "vpc_cidr" {
  description = "value of vpc cidr"
  type        = string
}

variable "azs" {
  description = "value of availability zones"
  type        = list(string)
}

variable "cluster_name" {
  description = "value of cluster name"
  type        = string
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
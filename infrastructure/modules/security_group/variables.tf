variable "security_group_name" {
  description = "value of security group name"
  type = string
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
  description = "value of rule"
  type = string
}

variable "ports" {
  description = "value of port"
  type = string
}
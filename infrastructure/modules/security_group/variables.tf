
variable "eks_cluster_ingress_cidr_blocks" {
  description = "List of CIDR blocks for allowed ingress traffic"
  type        = list(string)
}

variable "eks_cluster_egress_cidr_blocks" {
  description = "List of CIDR blocks for allowed egress traffic"
  type        = list(string)
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

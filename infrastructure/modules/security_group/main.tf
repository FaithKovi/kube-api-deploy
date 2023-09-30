module "cluster_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.security_group_name
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  # vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["10.10.0.0/16"]
  ingress_rules            = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = var.from_port
      to_port     = var.to_port
      protocol    = "tcp"
      description = "app ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      rule        = var.rule
      cidr_blocks = "0.0.0.0/0"
      ports       = "var.ports"
      
    },
  ]
}
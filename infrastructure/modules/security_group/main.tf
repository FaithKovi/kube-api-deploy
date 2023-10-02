module "eks_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  # Security group settings
  name        = "{var.cluster_name}-sg"
  description = "Security group for EKS cluster"
  vpc_id      = module.vpc.vpc_id

  # Ingress rules (allow incoming traffic)
  ingress_cidr_blocks = var.ingress_rules
}

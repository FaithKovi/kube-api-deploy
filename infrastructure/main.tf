



module "vpc" {
  source             = "./modules/vpc"
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  cluster_name       = var.cluster_name
  cidr_blocks        = var.cidr_blocks
  from_port          = var.from_port
  to_port            = var.to_port
  protocol           = var.protocol
}

module "eks" {
  source                         = "./modules/eks"
  cluster_name                   = var.cluster_name
  ami_type                       = var.ami_type
  max_size                       = var.max_size
  min_size                       = var.min_size
  desired_size                   = var.desired_size
  from_port                      = var.from_port
  to_port                        = var.to_port
  protocol                       = var.protocol
  instance_types                 = var.instance_types
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
}

# data "aws_eks_cluster_auth" "cluster" {
#   name = aws_eks_cluster.cluster.name
# }

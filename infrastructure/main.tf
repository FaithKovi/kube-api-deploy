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





























# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_id
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = module.eks.cluster_id
# }

# provider "kubernetes" {
#   host                   = module.eks.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
#   load_config_file       = false
# }


# module "vpc" {
#   source                    = "./modules/vpc"
#   vpc_name                  = var.vpc_name
#   vpc_cidr_block            = var.vpc_cidr_block
#   private_subnet_cidr_block = var.private_subnet_cidr_block
#   public_subnet_cidr_block  = var.public_subnet_cidr_block
#   availability_zones        = var.availability_zones
#   cluster_name              = var.cluster_name
# }

# module "eks_security_group" {
#   source = "./modules/security_group" # Reference the security group configuration in securitygroup.tf
#   # vpc_id = module.cluster_vpc.vpc_id
#   eks_cluster_ingress_cidr_blocks = var.eks_cluster_ingress_cidr_blocks
#   eks_cluster_egress_cidr_blocks  = var.eks_cluster_egress_cidr_blocks
#   ingress_rules                   = var.ingress_rules
# }

# module "eks" {
#   source       = "./modules/eks" # Reference the EKS configuration in eks.tf
#   cluster_name = var.cluster_name
#   asg_max_size = var.asg_max_size
#   asg_min_size = var.asg_min_size
#   # subnet_ids           = module.vpc.subnet_ids
#   # vpc_id               = module.vpc.vpc_id
#   asg_desired_capacity = var.asg_desired_capacity
#   instance_type        = var.instance_type
#   environment          = var.environment
#   application_name     = var.application_name
#   cluster_version      = var.cluster_version
# }



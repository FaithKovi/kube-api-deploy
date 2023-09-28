
module "vpc" {
    source = "./modules/vpc" # Reference the VPC configuration in vpc.tf
    cidr_block = var.vpc_cidr_block
    azs = var.azs
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    enable_nat_gateway = var.enable
}

module "cluster_sg" {
    source = "./modules/security_group" # Reference the security group configuration in securitygroup.tf
    vpc_id = module.cluster_vpc.vpc_id
    # cluster_name = var.cluster_name
    cluster_sg_description = "Security group for EKS cluster"
    cluster_ingress_cidr_blocks = var.cluster_ingress_cidr_blocks
}

module "eks" {
    source = "./modules/eks_cluster" # Reference the EKS configuration in eks.tf
    cluster_name = var.cluster_name
    subnets = module.cluster_vpc.private_subnets
    vpc_id = module.vpc.vpc_id
    cluster_version = var.cluster_version
}
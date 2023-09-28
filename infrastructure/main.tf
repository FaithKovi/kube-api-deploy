provider "aws" {
  region = var.region
}


module "cluster_vpc" {
    source = "./vpc" # Reference the VPC configuration in vpc.tf
    region = var.region
    cidr_block = var.vpc_cidr_block
    azs = var.azs
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    enable_nat_gateway = var.enable
}

module "cluster_security_group" {
    source = "./securitygroup" # Reference the security group configuration in securitygroup.tf
    region = var.region
    vpc_id = module.cluster_vpc.vpc_id
    cluster_name = var.cluster_name
    cluster_sg_description = "Security group for EKS cluster"
    cluster_ingress_cidr_blocks = var.cluster_ingress_cidr_blocks
}

module "eks" {
    source = "./eks" # Reference the EKS configuration in eks.tf
    region = var.region
    cluster_name = var.cluster_name
    subnets = module.cluster_vpc.private_subnets
    vpc_id = module.vpc.vpc_id
    cluster_version = var.cluster_version
}
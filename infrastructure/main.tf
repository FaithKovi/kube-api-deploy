data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host = module.eks.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token = data.aws_eks_cluster_auth.cluster.token
  load_config_file = false
}



module "vpc" {
    source = "./modules/vpc" 
    vpc_name = var.vpc_name
    vpc_cidr_block = var.vpc_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block
    public_subnet_cidr_block = var.public_subnet_cidr_block
    availability_zones = var.azs
    cluster_name = var.cluster_name
}

module "cluster_sg" {
    source = "./modules/security_group" # Reference the security group configuration in securitygroup.tf
    # vpc_id = module.cluster_vpc.vpc_id
    from_port = var.from_port
    to_port = var.to_port
    rule = var.rule
    ports = var.ports
    security_group_name = var.security_group_name
}

module "eks" {
    source = "./modules/eks_cluster" # Reference the EKS configuration in eks.tf
    cluster_name = var.cluster_name
    instance_type = var.instance_type
    environment = var.environment
    application_name = var.application_name
    cluster_version = var.cluster_version
}



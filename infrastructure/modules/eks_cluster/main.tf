data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version

  subnets = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  worker_groups = {
    worker_group_1 = {
      instance_type = var.instance_type
      asg_max_size  = 1
    }
    worker_group_2 = {
      instance_type = var.instance_type
      asg_max_size  = 1
    }
  }

  tags = {
    environment = "var.environment"
    Terraform = "true"
    application = "var.application_name"
  }
}
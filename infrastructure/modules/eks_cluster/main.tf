data "aws_eks_cluster" "main" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "main" {
  name = var.cluster_name
  depends_on = [ data.aws_eks_cluster.main ] # This is required to ensure that the EKS cluster is in the ACTIVE state before using its credentials.
}


module "eks" {
    source = "terraform-aws-modules/eks/aws"
    # version = "12.0.0"
    cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    subnets = var.subnets
    vpc_id = var.vpc_id
    node_groups = {
        eks_nodes = {
            desired_capacity = var.workers_desired_capacity
            max_capacity = var.max_capacity
            min_capacity = var.min_capacity
            instance_type = var.instance_type
            ami_type = var.ami_type
        }
    }
    tags = {
        Environment = "dev"
        Terraform = "true"
    }
}
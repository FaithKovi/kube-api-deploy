data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  subnet_ids = module.vpc.subnet_ids
  vpc_id     = module.vpc.vpc_id

  worker_groups = {
    eks_nodes = {
      instance_type        = var.instance_type
      asg_desired_capacity = var.asg_desired_capacity
      asg_max_size         = var.asg_max_size
      asg_min_size         = var.asg_min_size
    }
  }

  # Security group module reference
  eks_security_group_id = module.eks_security_group.security_group_id

  # Security group module reference
  eks_security_group_name        = "eks-cluster-sg"
  eks_security_group_description = "Security group for EKS cluster"
  eks_security_group_ingress_rules = [
    {
      from_port   = 443 # Example: Allow HTTPS traffic
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Customize as needed
    }
  ]
}



resource "aws_iam_role_policy_attachment" "eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = module.eks.workers_iam_role_name
}



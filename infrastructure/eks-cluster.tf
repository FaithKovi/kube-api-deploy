provider "kubernetes" {
  host = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token = data.aws_eks_cluster_auth.cluster.token
  load_config_file = false
  version = "~> 1.11"
}

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

  subnets = module.network-vpc.private_subnets
  vpc_id = module.network-vpc.vpc_id

  worker_groups = {
    worker_group_1 = {
      instance_type = "t2.micro"
      asg_max_size  = 1
    }
    worker_group_2 = {
      instance_type = "t2.micro"
      asg_max_size  = 1
    }
  }

  tags = {
    environment = "dev"
    Terraform = "true"
    application = "var.application_name"
  }
}
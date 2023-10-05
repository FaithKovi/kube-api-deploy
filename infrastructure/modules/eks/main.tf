module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.4"

  cluster_name                   = var.cluster_name
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
}
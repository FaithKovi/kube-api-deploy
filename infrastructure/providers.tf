# providers.tf

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.72.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  alias       = "eks_cluster"
  config_path = "~/.kube/config" # Path to kubeconfig
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}
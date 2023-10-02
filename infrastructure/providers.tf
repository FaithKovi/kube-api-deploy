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

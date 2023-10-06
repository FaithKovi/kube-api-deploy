# This is where you input the variables you want to use in the script
region                         = "us-east-1"
cluster_name                   = "eks-cluster"
cluster_endpoint_public_access = true
ami_type                       = "AL2_x86_64"
instance_types                 = ["m5n.large"]
min_size                       = 1
max_size                       = 2
desired_size                   = 1
from_port                      = 80
to_port                        = 80
protocol                       = "tcp"
vpc_name                       = "eks-cluster-vpc"
vpc_cidr                       = "10.10.0.0/16"
azs                            = ["us-east-1a", "us-east-1b", "us-east-1c"]
cidr_blocks                    = ["10.10.1.0/16", "10.10.2.0/16", "10.10.3.0/16"]


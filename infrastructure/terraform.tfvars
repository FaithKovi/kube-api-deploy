# This is where you input the variables you want to use in the script
region                         = "us-east1"
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
availability_zones             = ["us-east1a", "us-east1b", "us-east1c"]
cidr_blocks                    = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]         
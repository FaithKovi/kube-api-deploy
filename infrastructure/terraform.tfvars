# This is where you input the variables you want to use in the script
vpc_name                  = eks-cluster-vpc
vpc_cidr_block            = "10.0.0.0/16"
public_subnet_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_block = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_region                = "us-east-1"
cluster_name              = "eks-cluster"
application_name          = "eks-app"
security_group_name       = "eks-cluster-sg"
from_port                 = 22
to_port                   = 80
protocol                  = "tcp"
ingress_cidr_blocks       = ["0.0.0.0/0"]
         
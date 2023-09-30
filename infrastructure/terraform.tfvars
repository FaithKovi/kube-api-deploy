# This is where you input the variables you want to use in the script
vpc_name                  = eks-cluster-vpc
vpc_cidr_block            = "10.0.0.0/16"
public_subnet_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_block = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
# availability_zones = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
aws_region          = "us-east-1"
cluster_name        = "eks-cluster"
application_name    = "eks-app"
security_group_name = "eks-cluster-sg"
from_port           = 22
to_port             = 80
protocol            = "tcp"





# aws_region = ""                 # This is the AWS region you want to use
# cluster_name = ""               # This is the name of the cluster you want to create
# cluster_version = ""            # This is the version of EKS you want to use
# cluster_security_group_id = ""  # This is the security group you want to use
# vpc_id = ""                     # This is the VPC you want to use
# subnets = [ "value", "value" ]  # This is the list of subnets you want to use
# workers_desired_capacity = 0    # This is the number of worker nodes you want to start with
# instance_type = ""              # This is the instance type you want to use
# max_capacity = 0                # This is the maximum number of worker nodes you want to allow
# min_capacity = 0                # This is the minimum number of worker nodes you want to allow
# ami_type = ""                   # This is the AMI type you want to use
# This is the VPC you want to use
# subnets = [ "value", "value" ]  # This is the list of subnets you want to use
workers_desired_capacity = 1          # This is the number of worker nodes you want to start with
instance_type            = "t2.micro" # This is the instance type you want to use
max_capacity             = 2          # This is the maximum number of worker nodes you want to allow
min_capacity             = 1          # This is the minimum number of worker nodes you want to allow
ami_type                 = "AL2_X86_64"
map_public_ip_on_launch  = true # This is the AMI type you want to use
availability_zones       = ["us-east-1a", "us-east-1b"]
ingress_from_port        = 22
ingress_to_port          = 80
ingress_protocol         = "tcp"
egress_from_port         = 0
egress_to_port           = 0
egress_protocol          = "tcp"
         
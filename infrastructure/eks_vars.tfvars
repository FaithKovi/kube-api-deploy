# This is where you input the variables you want to use in the script

aws_region = ""                 # This is the AWS region you want to use
cluster_name = ""               # This is the name of the cluster you want to create
cluster_version = ""            # This is the version of EKS you want to use
cluster_security_group_id = ""  # This is the security group you want to use
vpc_id = ""                     # This is the VPC you want to use
subnets = [ "value", "value" ]  # This is the list of subnets you want to use
workers_desired_capacity = 0    # This is the number of worker nodes you want to start with
instance_type = ""              # This is the instance type you want to use
max_capacity = 0                # This is the maximum number of worker nodes you want to allow
min_capacity = 0                # This is the minimum number of worker nodes you want to allow
ami_type = ""                   # This is the AMI type you want to use

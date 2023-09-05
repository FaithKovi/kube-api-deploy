provider "aws" {
  region = var.region
}

module "network" {
    source = "./modules/network"
    vpc_cidr_block = var.vpc_cidr_block
    public_subnet_cidr_block = var.public_subnet_cidr_block
    availability_zones = var.availability_zones
    map_public_ip_on_launch = var.map_public_ip_on_launch
    ingress_from_port = var.ingress_from_port
    egress_from_port = var.egress_from_port
    ingress_to_port = var.ingress_to_port
    egress_to_port = var.egress_to_port
    ingress_protocol = var.ingress_protocol
    egress_protocol = var.egress_protocol
    cluster_security_group_name = var.cluster_security_group_name
}

module "eks_cluster" {
    source = "./modules/eks_cluster"
    cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    cluster_security_group_id = var.cluster_security_group_id
    vpc_id = var.vpc_id
    subnets = var.subnets
    workers_desired_capacity = var.workers_desired_capacity
}

output "kubeconfig" {
  value = module.eks_cluster.kubeconfig
}
  
resource "local_file" "kubeconfig" {
  content = module.eks_cluster.kubeconfig
  filename = "~/kubeconfig.yaml" # This is the file that will be created locally
}
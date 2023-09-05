output "subnet_ids" {
  value = module.network.subnet_ids
}
  
output "vpc_id" {
  value = module.network.vpc_id
}

output security_group_id {
  value = module.network.security_group_id
}

output "kubeconfig" {
  value = module.eks_cluster.kubeconfig
}

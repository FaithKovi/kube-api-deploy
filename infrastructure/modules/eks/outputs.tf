output "cluster_name" {
  value = module.eks.cluster_name
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "eks_security_group_id" {
  value = module.eks.security_group_id
}

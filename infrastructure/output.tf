output "cluster_id" {
  value = data.aws_eks_cluster.cluster.cluster_id
}

output "kubeconfig" {
  value = data.aws_eks_cluster.cluster.kubeconfig
}
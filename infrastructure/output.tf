output "kubeconfig" {
  value = aws_eks_cluster.cluster.kubeconfig
}
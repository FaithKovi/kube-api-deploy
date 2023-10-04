output "vpc_id" {
  value = module.vpc.vpc_id
}

# output "cluster_security_group_id" {
#   description = "Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console"
#   value       = module.vpc.cluster_security_group_id
# }

# output "cluster_security_group_arn" {
#   description = "Amazon Resource Name (ARN) of the cluster security group"
#   value       = module.vpc.cluster_security_group_arn
# }

# output "cluster_iam_role_name" {
#   description = "IAM role name of the EKS cluster"
#   value       = module.vpc.cluster_iam_role_name
# }

# output "cluster_iam_role_arn" {
#   description = "IAM role ARN of the EKS cluster"
#   value       = module.vpc.cluster_iam_role_arn
# }

# output "cluster_iam_role_unique_id" {
#   description = "Stable and unique string identifying the IAM role"
#   value       = module.vpc.cluster_iam_role_unique_id
# }
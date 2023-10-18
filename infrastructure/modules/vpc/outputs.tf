output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "cluster_security_group_id" {
  description = "value of security group id"
  value       = aws_security_group.cluster.id
}
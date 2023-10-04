module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.4"

  cluster_name                   = var.cluster_name
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
}

# vpc_id                   = module.vpc.vpc_id
# subnet_ids               = module.vpc.private_subnets
# control_plane_subnet_ids = module.vpc.intra_subnets

# # Extend cluster security group rules
# cluster_security_group_additional_rules = {
#   ingress_nodes_ephemeral_ports_tcp = {
#     description                = "Nodes on ephemeral ports"
#     protocol                   = var.protocol
#     from_port                  = var.from_port
#     to_port                    = var.to_port
#     type                       = "ingress"
#     source_node_security_group = true
#   }


# # Extend node-to-node security group rules
# node_security_group_additional_rules = {
#   ingress_self_all = {
#     description = "Node to node all ports/protocols"
#     protocol    = "-1"
#     from_port   = 0
#     to_port     = 0
#     type        = "ingress"
#     self        = true
#   }
# }

# eks_managed_node_groups = {
#   cluster_wg = {
#     min_size     = var.min_size
#     max_size     = var.max_size
#     desired_size = var.desired_size
#     instance_types = var.instance_types
#   }
# }
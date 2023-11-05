module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name                   = var.cluster_name
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  subnet_ids                     = var.subnet_ids
  vpc_id                         = var.vpc_id


  # Extend cluster security group rules
  cluster_security_group_additional_rules = {
    ingress_nodes_ephemeral_ports_tcp = {
      description                = "Nodes on ephemeral ports"
      protocol                   = "tcp"
      from_port                  = 80
      to_port                    = 80
      type                       = "ingress"
      source_node_security_group = true

    }
    # Test: https://github.com/terraform-aws-modules/terraform-aws-eks/pull/2319
    ingress_source_security_group_id = {
      description              = "Ingress from another computed security group"
      protocol                 = "tcp"
      from_port                = 22
      to_port                  = 22
      type                     = "ingress"
      source_security_group_id = var.cluster_security_group_id

    }
  }


  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type       = var.ami_type
    instance_types = var.instance_types

    attach_cluster_primary_security_group = true
    vpc_security_group_ids                = [var.cluster_security_group_id]
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = 1

      instance_types = var.instance_types
      capacity_type  = "SPOT"
      labels = {
        Environment = "test"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }

      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "gpuGroup"
          effect = "NO_SCHEDULE"
        }
      }

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 100
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            delete_on_termination = true
          }
        }
      }

      update_config = {
        max_unavailable_percentage = 33 # or set `max_unavailable`
      }

      tags = {
        ExtraTag = "cluster"
      }
    }
  }




}
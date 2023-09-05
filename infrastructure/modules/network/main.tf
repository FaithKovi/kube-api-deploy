resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  count = length(var.public_subnet_cidr_block)
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_security_group" "eks_cluster" {
  name        = var.cluster_security_group_name
  description = "Allow all inbound traffic from the VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = [var.vpc_cidr_block]
  }
}


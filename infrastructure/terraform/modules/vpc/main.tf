# VPC module - thin wrapper around terraform-aws-modules/vpc/aws.
#
# This module exists so consumers (environments) can call a single
# in-repo module instead of pinning the upstream module directly
# in every environment. Keep the surface small and opinionated.

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.enable_nat_gateway
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = var.tags
}

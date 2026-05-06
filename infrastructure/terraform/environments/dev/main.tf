provider "aws" {
  region = var.region

  default_tags {
    tags = local.common_tags
  }
}

locals {
  common_tags = {
    Environment = "dev"
    Project     = "mlops-platform"
    ManagedBy   = "terraform"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  name            = "${var.project}-dev"
  cidr            = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway

  tags = local.common_tags
}

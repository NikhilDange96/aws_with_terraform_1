locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = var.managed_by
  }
}

module "vpc" {

  source = "./vpc"

  vpc_cidr = var.vpc_cidr

  environment = var.environment

  common_tags = local.common_tags
}
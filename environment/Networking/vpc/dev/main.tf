module "vpc_module" {
  source = "../../../modules/Networking/vpc"

  vpc_cidr    = var.vpc_cidr
  environment = var.environment

  common_tags = {
    Environment = var.environment
  }
}


module "subnet_module" {
  source = "../../../../modules/Networking/subnets"

  vpc_id = module.vpc_module.vpc_id

  public_subnets = [
    "10.0.1.0/24"
  ]

  private_subnets = [
    "10.0.2.0/24"
  ]

  availability_zones = [
    "ap-south-1a"
  ]

  common_tags = {
    Environment = var.environment
  }

  environment  = var.environment
  cluster_name = "dev-cluster"
}
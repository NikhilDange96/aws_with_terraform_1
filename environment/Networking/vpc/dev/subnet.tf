module "subnet_module" {
  source = "../../../modules/Networking/subnets"

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

resource "aws_nat_gateway" "main" {
  allocation_id = module.vpc_module.eip_id
  subnet_id     = module.subnet_module.public_subnet_ids[0]

  tags = {
    Name        = "dev-nat-gateway"
    Environment = var.environment
  }

  depends_on = [
    module.vpc_module,
    module.subnet_module
  ]
}

resource "aws_route_table" "public" {
  vpc_id = module.vpc_module.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc_module.internet_gateway_id
  }

  tags = {
    Name        = "public_rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = module.subnet_module.public_subnet_ids[0]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = module.vpc_module.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name        = "private_rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = module.subnet_module.private_subnet_ids[0]
  route_table_id = aws_route_table.private.id
}

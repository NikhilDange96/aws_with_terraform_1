output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "internet_gateway_id" {
  value = module.vpc_module.internet_gateway_id
}

output "public_subnet_ids" {
  value = module.subnet_module.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.subnet_module.private_subnet_ids
}
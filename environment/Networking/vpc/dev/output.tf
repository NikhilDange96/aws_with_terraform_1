output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "internet_gateway_id" {
    value = module.vpc_module.internet_gateway_id
}
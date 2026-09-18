module "ec2_module" {
  source = "../../../modules/compute/ec2"

  instance_count = var.instance_count
  instance_name  = var.instance_name
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  subnet_id      = data.terraform_remote_state.vpc_backend.outputs.public_subnet_ids[0]
  public_ip      = var.public_ip
  security_group_id = [aws_security_group.allow_tls.id]
}

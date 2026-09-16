resource "tls_private_key" "custom_key" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "custom_key" {
  key_name   = "custom-key"
  public_key = tls_private_key.custom_key.public_key_openssh

  lifecycle {
    ignore_changes = [public_key]
  }
}

resource "local_file" "custom_key" {
  content         = tls_private_key.custom_key.private_key_openssh
  filename        = "${path.module}/custom-key.pem"
  file_permission = "0600"
}

resource "aws_instance" "web_app" {
  ami           = var.ami_id
  subnet_id     = var.subnet_id
  instance_type = var.instance_type

  associate_public_ip_address = var.public_ip

  key_name = aws_key_pair.custom_key.key_name

  vpc_security_group_ids = [
    aws_security_group.allow_tls.id
  ]

  tags = {
    Name = var.tags
  }

}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.terraform_remote_state.vpc_backend.outputs.vpc_id

  tags = {
    Name = "tf-day-03-sg"
  }
}


resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}


resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}



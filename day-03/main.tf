resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-02eea3f7f4a9d02e0"

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




resource "aws_instance" "web_app" {
    ami = var.ami_id
    subnet_id = var.subnet_id 
    instance_type = var.instance_type
    # count = var.instance_count
    associate_public_ip_address = var.public_ip
    key_name = "B2-mumbai-key"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "Hello from Terraform User Data!" > /var/www/html/index.html
              EOF

tags = {
Name =  "web-app"
}
  
}



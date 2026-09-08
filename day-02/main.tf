resource "aws_instance" "web_app" {
    ami = var.ami_id
    subnet_id = var.subnet_id 
    instance_type = var.instance_type
    # count = var.instance_count
    associate_public_ip_address = var.public_ip



tags = {
Name =  "web-app"
}
  
}

output "instance_public_ip" {
    description = "this is for aws instance public ip"
    value = aws_instance.web_app.public_ip
  
}
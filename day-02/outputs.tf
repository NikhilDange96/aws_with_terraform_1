output "instance_public_ip" {
    description = "this is for aws instance public ip"
    value = aws_instance.web_app.public_ip
  
}
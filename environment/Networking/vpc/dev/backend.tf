terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-fct"
    key    = "networking/vpc/dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
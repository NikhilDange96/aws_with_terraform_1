terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-fct"
    key    = "compute/day-03/terraform.tfstate"
    region = "ap-south-1"
  }
}
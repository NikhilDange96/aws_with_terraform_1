terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-fct"
    key    = "storage/s3-bucket/dev/test/terraform.tfstate"
    region = "ap-south-1"
  }
}
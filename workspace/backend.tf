terraform {
  backend "s3" {
    bucket = "terraform-remote-backend-april-fct"
    key    = "compute/dev-workspace/file-provisner/terraform.tfstate"
    region = "ap-south-1"
  }
}
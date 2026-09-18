variable "vpc_cidr" {

  type = string
}

variable "environment" {

  type = string
}

variable "common_tags" {

  type = map(string)
} 

variable "public_subnet_id" {
  type    = string
  default = null
}
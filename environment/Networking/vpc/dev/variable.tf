variable "vpc_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
  
}

variable "enable_dns_support" {
  type = bool
}

variable "public_subnet_01_cidr" {
  type = string
  
}
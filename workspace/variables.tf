variable "ami_id" {
  type = string


}


variable "subnet_id" {
  type = string


}

variable "instance_type" {
  type = string


}

variable "instance_count" {
  type    = number
  default = 1

}

variable "public_ip" {
  type        = bool
  default     = true
  description = "this is for the public ip"

}

variable "tags" {
  type = string

}

variable "sg_tag" {
  type = string

}
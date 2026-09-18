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
    type = number
    default = 1
}

variable "public_ip" {
    type = bool
    
    description = "this is for the public ip"
  
}

variable "instance_name" {
  type = string
  
}

variable "security_group_id" {
  
}
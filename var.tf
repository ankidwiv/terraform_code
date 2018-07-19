variable "aws_region" {
  default = "ap-south-1"
}

variable "zones" {
  type = "map"

  default = {
    zone0 = "ap-south-1a"
    zone1 = "ap-south-1b"
  }
}

variable "cidr_blocks" {
  type = "list"

  default = ["10.0.1.0/24","10.0.2.0/24"]
  
}

variable "AZ" {
    type = "map"
    default = {
    ap-south-1 = ["ap-south-1a", "ap-south-1b"]
    us-east-1 = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d" ]
    }
}

variable "instance_count" {

    default = 2
}

variable "ami" {
    type = "map"
    
    default = {
    us-east-1 = "ami-6871a115"
    ap-south-1 = "ami-5b673c34"
    
    }
    
}

variable "instance_type" {
    default = "t2.micro"
    
}


variable "ssh_key" {
    type = "map"
    default = {
    us-east-1 = "My-us-east-key"
    ap-south-1 = "MyEc2key"
    
    }
    
}
    

variable "aws_region" {
default = "ap-south-1"
  
}


#Variable for VPC
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

# variable for subnet
variable "Public_subnet_cidrs" {
  type = "list"

  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "Private_subnet_cidrs" {
	type = "list"
	default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "AZ" {
    type = "list"
    default = ["ap-south-1a", "ap-south-1b"]
    
}

variable "instance_count" {
  default = 2
}

variable "ami" {

  default = "ami-5b673c34"
  }


variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_key" {

  default = "MyEc2key"
}

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
  type = "map"

  default = {
    zone0 = "10.0.1.0/24"
    zone1 = "10.0.2.0/24"
  }
}

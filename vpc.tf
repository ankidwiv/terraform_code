resource "aws_vpc" "My_Vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = 1
  enable_dns_hostnames = 1

  tags {
    name = "My_Vpc"
  }
}

